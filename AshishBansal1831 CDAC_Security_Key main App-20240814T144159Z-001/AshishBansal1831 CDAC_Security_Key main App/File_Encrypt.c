#include <gtk/gtk.h>   // GTK+ header for GUI functions
#include <stdio.h>     // Standard I/O library for file operations
#include <string.h>    // String library for string operations
#include <openssl/aes.h>  // AES encryption library
#include <openssl/rand.h> // Random number generator for AES key and IV
#include <openssl/evp.h>
#include <ctype.h>

// AES encryption/decryption key and IV
#define AES_KEY_SIZE 256 // AES key size in bits
#define AES_IV_SIZE 16   // AES IV size in bytes

static unsigned char aes_key[AES_KEY_SIZE / 8];
static unsigned char aes_iv[AES_IV_SIZE];


extern int g_argc;
extern char **g_argv;

// Function to generate a random AES key and IV
static void generate_aes_key_and_iv() 
{
    if (!RAND_bytes(aes_key, sizeof(aes_key))) 
    {
        g_error("Error generating AES key");
    }
    if (!RAND_bytes(aes_iv, sizeof(aes_iv))) 
    {
        g_error("Error generating AES IV");
    }
}

// Function to encrypt a file
static void encrypt_file(char *filename) 
{
    // Open the input file
    FILE *input_file = fopen(filename, "rb");
    if (!input_file) 
    {
        g_error("Error opening input file");
        return;
    }

    // Create the output file
    char output_filename[256];
    snprintf(output_filename, sizeof(output_filename), "%s.enc", filename);
    FILE *output_file = fopen(output_filename, "wb");
    if (!output_file) 
    {
        fclose(input_file);
        g_error("Error creating output file");
        return;
    }

    // Initialize AES encryption
    generate_aes_key_and_iv();
    EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();
    EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, aes_key, aes_iv);

    // Write the AES key and IV to the output file
    fwrite(aes_key, 1, sizeof(aes_key), output_file);
    fwrite(aes_iv, 1, sizeof(aes_iv), output_file);

    // Encrypt the input file and write to the output file
    unsigned char buffer[4096];
    unsigned char encrypted_buffer[4096 + EVP_MAX_BLOCK_LENGTH];
    int bytes_read, encrypted_bytes;
    while ((bytes_read = fread(buffer, 1, sizeof(buffer), input_file)) > 0) 
    {
        EVP_EncryptUpdate(ctx, encrypted_buffer, &encrypted_bytes, buffer, bytes_read);
        fwrite(encrypted_buffer, 1, encrypted_bytes, output_file);
    }
    EVP_EncryptFinal_ex(ctx, encrypted_buffer, &encrypted_bytes);
    fwrite(encrypted_buffer, 1, encrypted_bytes, output_file);

    // Clean up
    EVP_CIPHER_CTX_free(ctx);
    fclose(input_file);
    fclose(output_file);

    // Delete the original file
    remove(filename);

}

// Function to decrypt a file
static void decrypt_file(char *filename) 
{
    // Open the input file
    FILE *input_file = fopen(filename, "rb");
    if (!input_file) 
    {
        g_error("Error opening input file");
        return;
    }

    // Create the output file
    char output_filename[256];
    strncpy(output_filename, filename, strlen(filename) - 4);
    output_filename[strlen(filename) - 4] = '\0';
    FILE *output_file = fopen(output_filename, "wb");
    if (!output_file) 
    {
        fclose(input_file);
        g_error("Error creating output file");
        return;
    }

    // Read the AES key and IV from the input file
    fread(aes_key, 1, sizeof(aes_key), input_file);
    fread(aes_iv, 1, sizeof(aes_iv), input_file);

    // Initialize AES decryption
    EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();
    EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, aes_key, aes_iv);

    // Decrypt the input file and write to the output file
    unsigned char buffer[4096];
    unsigned char decrypted_buffer[4096];
    int bytes_read, decrypted_bytes;
    while ((bytes_read = fread(buffer, 1, sizeof(buffer), input_file)) > 0) 
    {
        EVP_DecryptUpdate(ctx, decrypted_buffer, &decrypted_bytes, buffer, bytes_read);
        fwrite(decrypted_buffer, 1, decrypted_bytes, output_file);
    }
    EVP_DecryptFinal_ex(ctx, decrypted_buffer, &decrypted_bytes);
    fwrite(decrypted_buffer, 1, decrypted_bytes, output_file);

    // Clean up
    EVP_CIPHER_CTX_free(ctx);
    fclose(input_file);
    fclose(output_file);

    // Delete the encrypted file
    remove(filename);

}

// Function to show file chooser dialog for encryption
void show_encryption_dialog() 
{
    GtkWidget *dialog;
    dialog = gtk_file_chooser_dialog_new
    (
        "Select a file to encrypt", 
        NULL, 
        GTK_FILE_CHOOSER_ACTION_OPEN, 
        "_Cancel", 
        GTK_RESPONSE_CANCEL, 
        "_Open", 
        GTK_RESPONSE_ACCEPT, 
        NULL
    );

     // Connect the Cancel button's "clicked" signal to the callback function
    // g_signal_connect(cancel_button, "clicked", G_CALLBACK(gtk_main_quit), NULL);

    // Add filters for file types (excluding encrypted files)
    GtkFileFilter *filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Text and Office files");
    gtk_file_filter_add_mime_type(filter, "text/plain");
    gtk_file_filter_add_mime_type(filter, "application/msword");
    gtk_file_filter_add_mime_type(filter, "application/vnd.ms-excel");
    gtk_file_filter_add_mime_type(filter, "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
    gtk_file_filter_add_mime_type(filter, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);



    if (gtk_dialog_run(GTK_DIALOG(dialog)) == GTK_RESPONSE_ACCEPT) 
    {
        char *filename;
        filename = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(dialog));
        encrypt_file(filename); // Encrypt the selected file
        g_free(filename); // Free the filename
    
	// Display success dialog
        GtkWidget *s_dialog = gtk_message_dialog_new
        (
        	NULL,
        	GTK_DIALOG_MODAL,
        	GTK_MESSAGE_INFO,
        	GTK_BUTTONS_NONE,
        	"File encrypted successfully."
    	);
    	gtk_dialog_run(GTK_DIALOG(s_dialog));
    	gtk_widget_destroy(s_dialog);
    }

    gtk_widget_destroy(dialog); // Destroy the dialog
}

// Function to show file chooser dialog for decryption
void show_decryption_dialog() 
{
    GtkWidget *dialog;
    dialog = gtk_file_chooser_dialog_new
    (
        "Select a file to decrypt", 
        NULL, 
        GTK_FILE_CHOOSER_ACTION_OPEN, 
        "_Cancel", 
        GTK_RESPONSE_CANCEL, 
        "_Open", 
        GTK_RESPONSE_ACCEPT, 
        NULL
    );

    // Add filter for encrypted files
    GtkFileFilter *filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Encrypted files");
    gtk_file_filter_add_pattern(filter, "*.enc");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);

    if (gtk_dialog_run(GTK_DIALOG(dialog)) == GTK_RESPONSE_ACCEPT) 
    {
        char *filename;
        filename = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(dialog));
        decrypt_file(filename); // Decrypt the selected file
        g_free(filename); // Free the filename
    	
    	// Display success dialog
	GtkWidget *dialog = gtk_message_dialog_new
    	(
        	NULL,
        	GTK_DIALOG_DESTROY_WITH_PARENT,
        	GTK_MESSAGE_INFO,
        	GTK_BUTTONS_OK,
        	"File decrypted successfully."
    	);
    	gtk_dialog_run(GTK_DIALOG(dialog));
    	gtk_widget_destroy(dialog);
    }

    gtk_widget_destroy(dialog); // Destroy the dialog
}


// Function to show options for encryption or decryption
void show_file_type_dialog() 
{
    GtkWidget *dialog, *content_area;
    GtkWidget *button_encrypt, *button_decrypt;

    // Create a new dialog with default buttons
    dialog = gtk_dialog_new(); // Use this if you do not want predefined buttons

    gtk_window_set_title(GTK_WINDOW(dialog), "Select Operation"); // Set dialog title
    
    gtk_window_set_default_size(GTK_WINDOW(dialog), 400, 200); // Adjust width and height as needed

    gtk_window_set_position(GTK_WINDOW(dialog), GTK_WIN_POS_CENTER);							       //
    
    content_area = gtk_dialog_get_content_area(GTK_DIALOG(dialog)); // Get content area of the dialog

    // Create and add buttons for encryption and decryption
    button_encrypt = gtk_button_new_with_label("Encrypt File");
    g_signal_connect(button_encrypt, "clicked", G_CALLBACK(show_encryption_dialog), dialog);
    gtk_box_pack_start(GTK_BOX(content_area), button_encrypt, TRUE, TRUE, 5);

    button_decrypt = gtk_button_new_with_label("Decrypt File");
    g_signal_connect(button_decrypt, "clicked", G_CALLBACK(show_decryption_dialog), dialog);
    gtk_box_pack_start(GTK_BOX(content_area), button_decrypt, TRUE, TRUE, 5);

    gtk_widget_show_all(dialog); // Show all widgets
}



void GUI_MAIN()
{
    GtkWidget *window;
    GtkWidget *vbox;
    GtkWidget *encrypt_button;
    GtkWidget *decrypt_button;
    GtkWidget *content_area;

    // Initialize GTK+
    gtk_init(&g_argc, &g_argv);

    // Create a new window
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Select Operation"); // Set dialog title
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200); // Adjust width and height as needed

    gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER);							       
    gtk_container_set_border_width(GTK_CONTAINER(window), 10);

    content_area = gtk_dialog_get_content_area(GTK_DIALOG(window)); // Get content area of the dialog

    // Connect the window's destroy signal to gtk_main_quit (to close the application)
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    // Create a vertical box container
    vbox = gtk_box_new(FALSE, 10);
    gtk_container_add(GTK_CONTAINER(window), vbox);

    // Create the Encrypt button
    encrypt_button = gtk_button_new_with_label("Encrypt");
    g_signal_connect(encrypt_button, "clicked", G_CALLBACK(show_encryption_dialog), window);
    gtk_box_pack_start(GTK_BOX(vbox), encrypt_button, TRUE, TRUE, 0);

    // Create the Decrypt button
    decrypt_button = gtk_button_new_with_label("Decrypt");
    g_signal_connect(decrypt_button, "clicked", G_CALLBACK(show_decryption_dialog), window);
    gtk_box_pack_start(GTK_BOX(vbox), decrypt_button, TRUE, TRUE, 0);

    // Show all widgets
    gtk_widget_show_all(window);

    // Start the GTK+ main loop
    gtk_main();
}

void GUI_ENC_()
{

}