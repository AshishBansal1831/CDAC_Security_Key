#include <gtk/gtk.h>   // GTK+ header for GUI functions
#include "Login.h"
#include "Crypto.h"

#define KEY 10

libusb_device_handle *handle;
libusb_context *context = NULL;

static char HOST_STRING[]    = "this string from host signed using Device Public Key()&*%^#$!@";
static char DEVICE_STRING[]  = "this string from Device signed using HOST Public Key!@#$%^&*()"; 

static void SendReport(Report report)
{
    int transferred;
     // Send data to OUT endpoint
    int ret = libusb_interrupt_transfer(handle, OUT_ENDPOINT, (uint8_t*)&report, sizeof(report), &transferred, 35000);
    if (ret < 0) {
        #ifdef DEBUG
        fprintf(stderr, "Failed to send data: %s\n", libusb_strerror(ret));
        #endif
    } else {
        #ifdef DEBUG
        printf("Sent %d bytes\n", transferred);
        #endif
    }
    sleep(1);
}

static Report ReceiveReport()
{
    int transferred;
    Report receive;

     // Perform an IN interrupt transfer
    int ret = libusb_interrupt_transfer(handle, ENDPOINT_IN, (uint8_t*)&receive, sizeof(receive), &transferred, 30000); // 5000 ms timeout
    if (ret == 0) 
    {
        #ifdef DEBUG
        printf("Received %d bytes: ", transferred);
        
        printf("%d, %d, ",receive.operation, receive.parameters);
        for (int i = 0; i < transferred; i++) {
            printf("%x, ", receive.data[i]);
        }
        printf("\n");
        #endif
    } 
    else 
    {
        #ifdef DEBUG
        fprintf(stderr, "Interrupt transfer failed: %s\n", libusb_strerror(ret));
        #endif
    }

    return receive;
}

static int initUSB()
{
    // Initialize libusb
    #ifdef DEBUG
    printf("In initUSB");
    #endif
    if (libusb_init(&context) < 0) {
        #ifdef DEBUG
        fprintf(stderr, "Failed to initialize libusb\n");
        #endif
        return EXIT_FAILURE;
    }

#ifdef DEBUG
    // Set logging level to LIBUSB_LOG_LEVEL_DEBUG
    libusb_set_option(context, LIBUSB_OPTION_LOG_LEVEL, LIBUSB_LOG_LEVEL_DEBUG);
#endif 

    // Open the USB device  
    handle = libusb_open_device_with_vid_pid(context, VENDOR_ID, PRODUCT_ID);
    if (!handle) {
        #ifdef DEBUG
        fprintf(stderr, "Failed to open device\n");
        #endif
        libusb_exit(context);
        return EXIT_FAILURE;
    }

    // Detach kernel driver if necessary
    if (libusb_kernel_driver_active(handle, INTERFACE_NUM) == 1) {
        printf("Kernel driver active, detaching...\n");
        if (libusb_detach_kernel_driver(handle, INTERFACE_NUM) < 0) {
            // fprintf(stderr, "Failed to detach kernel driver\n");
            libusb_close(handle);
            libusb_exit(context);
            return EXIT_FAILURE;
        }
    }

    // Claim the interface
    if (libusb_claim_interface(handle, INTERFACE_NUM) < 0) {
        // fprintf(stderr, "Failed to claim interface\n");
        libusb_close(handle);
        libusb_exit(context);
        return EXIT_FAILURE;
    }
    return EXIT_SUCCESS;
}

int  confirmUSB()
{   
    static uint8_t flag = 0;
    
    
    if(flag == 0 && initUSB() == EXIT_FAILURE)
        return EXIT_FAILURE;

    flag = 1;

    Report confirmReport = {.operation = DECODE_STRING};

    SendReport(confirmReport);
#ifdef DEBUG
    printf("Report 1 sent\n");
#endif
    
    confirmReport = ReceiveReport();   

#ifdef DEBUG
    printf("Received String : ");
#endif

    for(uint8_t i=0; i<sizeof(confirmReport.data); ++i)
    {
        // printf("%c,", confirmReport.data[i]);
        confirmReport.data[i] -= KEY;
    }

    if(memcmp((char*)confirmReport.data, "Encode this string", 19) == 0)
    {
        printf("Success\n");
        return EXIT_SUCCESS;    
    }

    return EXIT_FAILURE;
}

uint8_t getFingerPrintID()
{
    // printf("Enroll\n");
    Report fingerprint = {.operation = HANDLE_FINGERPRINT, .parameters = F_IDENTITFY};

    SendReport(fingerprint);
    fingerprint = ReceiveReport();
    // printf("data %d\n" ,fingerprint.data[0]);
    return fingerprint.data[0];
    // return 1;
}

uint8_t enrollNewUser(uint8_t ID)
{
    static uint8_t flag = 0;
    if(flag == 1)
        ID = 0;
    
    Report fingerprint = {.operation = HANDLE_FINGERPRINT, .parameters = F_ENROLL, .data[0] = ID};
    
    // printf("ID = %d\n", fingerprint.data[0]);
    SendReport(fingerprint);
    sleep(5);
    fingerprint = ReceiveReport();
    flag = 1;
    return fingerprint.data[0];
}

uint8_t getNewFingerprintID()
{
    Report fingerprint = {.operation = HANDLE_FINGERPRINT, .parameters = F_NEWID, .data ={0}};

    SendReport(fingerprint);
#ifdef DEBUG
    g_print("Sent\n");
#endif
    sleep(4);

    fingerprint = ReceiveReport();
#ifdef DEBUG
    g_print("Received\n");
#endif
    return fingerprint.data[0];
}


int DeinitUSB()
{
    // Release the interface
    libusb_release_interface(handle, INTERFACE_NUM);

    // Reattach kernel driver if necessary
    if (libusb_kernel_driver_active(handle, INTERFACE_NUM) == 0) {
        printf("Attaching kernel driver...\n");
        if (libusb_attach_kernel_driver(handle, INTERFACE_NUM) < 0) {
            fprintf(stderr, "Failed to attach kernel driver\n");
        }
    }

    // Close the device
    libusb_close(handle);

    // Exit libusb
    libusb_exit(context);
}
