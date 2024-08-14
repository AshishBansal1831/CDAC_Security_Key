#include <gtk/gtk.h>   // GTK+ header for GUI functions
#include <stdio.h>
#include <stdio_ext.h>
#include<stdlib.h>
#include <termios.h>
#include <unistd.h>
#include <ctype.h>

#include "Login.h"

#define MAX_PASSWORD_LENGTH 128

const char *FILE_NAME = ".credentials.";

void Main_Menu();
void Login_Page();
void SignUp_Page();
void show_file_type_dialog();
void GUI_MAIN();
void show_encryption_dialog();
void show_decryption_dialog();

int g_argc;
char **g_argv;

int main(int argc, char *argv[])
{
    g_argc = argc;
    g_argv =argv;

    Main_Menu();
}

// Function to validate the password based on specified rules
static int validate_password(const char *password) 
{
    int length = strlen(password);
    if (length < 8 || length > 12) 
    {
        return 0;
    }

    if (!isalnum(password[0])) 
    {
        return 0;
    }

    int has_upper = 0, has_lower = 0, has_digit = 0, has_special = 0;

    for (int i = 0; i < length; i++) 
    {
        if (isupper(password[i])) has_upper = 1;
        if (islower(password[i])) has_lower = 1;
        if (isdigit(password[i])) has_digit = 1;
        if (ispunct(password[i])) has_special = 1;
    }

    return has_upper && has_lower && has_digit && has_special;
}

void get_password(char *password, size_t max_length) {
    struct termios oldt, newt;
    int i = 0;
    char ch;

    __fpurge(stdin);

    // Get the current terminal settings
    tcgetattr(STDIN_FILENO, &oldt);
    newt = oldt;

    // Disable echoing of typed characters
    newt.c_lflag &= ~(ECHO);

    // Set the new terminal settings
    tcsetattr(STDIN_FILENO, TCSANOW, &newt);

    // Read the password
    printf("Enter password: ");
    while ((ch = getchar()) != '\n' && ch != EOF && i < max_length - 1) {
        password[i++] = ch;
    }
    password[i] = '\0';  // Null-terminate the string

    // Restore the original terminal settings
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);

    printf("\n");
}

void Main_Menu()
{
    int usb_init;
    int choice;
    do
    {
        printf("=========================+Main Menu=============================\n");
        printf("1. Login\n");
        printf("2. Signup\n");
        printf("3. Exit\n");

        scanf("%d", &choice);

        switch (choice)
        {
        case 1:    
        case 2:
            usb_init = confirmUSB();
            switch (choice)
            {
            case 1:
                Login_Page();
                break;
            case 2:
                SignUp_Page();
                break;
            }
            
            break;

        case 3:
            return;
        default:
            break;
        }
    }while(choice!=3);
}

void Login_Page()
{
    int8_t login_successful = 0;
    int8_t attempts = 0;

    char password[MAX_PASSWORD_LENGTH];
    
    char username[256];

    char stored_username[256];
    char stored_password[256]; // Buffers for storing username and password
    do
    {
        printf("Put your finger on Device\n");

        int FingerPrintID;

        do{
            FingerPrintID = getFingerPrintID();
            printf("User ID : %d\n", FingerPrintID);
            usleep(100);
        }while(FingerPrintID == 0);

        sprintf(username, "%d", FingerPrintID);
        // printf("Password : ");
        get_password(password, MAX_PASSWORD_LENGTH);

        FILE* login_file = fopen(FILE_NAME, "r");
        if(login_file == NULL)
        {
            printf("Error Occured while Logging in\n");
            return;
        }

        // Read credentials from file and check if username and password match
        while (fscanf(login_file, "%255s %255s", stored_username, stored_password) == 2) 
        {
            // printf("P : %s %s %s\n", stored_password, password, stored_username);
            if (strcmp(password, stored_password) == 0) 
            {
                login_successful = 1; // Set flag if credentials match
                break;
            }
        }

        fclose(login_file); // Close the file

        if(login_successful == 0)
        {
            printf("Wrong Password try Again\n");
            attempts++;
        }
    }while(login_successful!=1 && attempts <3);

    if(login_successful == 0)
    {
        printf("3 attempts used\n");
        return;
    }

    // GUI_MAIN();

    int choice;

    printf("1. Encyrption\n");
    printf("2. Decyrption\n");
    printf("3. BACK\n");
    scanf("%d", &choice);

    if(choice > 2)
    {
        return;
    }

    gtk_init(&g_argc, &g_argv);

    if(choice == 1)
    {
        show_encryption_dialog();
    }
    else
    {
        show_decryption_dialog();
    }
}

void SignUp_Page()
{
    int newUserID = 1;
    char username[256];
    char password[256];

    printf("Size = %ld\n", sizeof(Report));

    do
    {        
        printf("Insode\n");
        newUserID = getNewFingerprintID();
        printf("New ID = %d\n", newUserID);
    } while (newUserID ==0 || newUserID > 30);
    
    int response, previous_response = 0;

    printf("Put your finger on Device\n");
    printf("IF THE RESPONSE IS NOT CHANGING TRY CORRECTING THE POSITION OF YOUR FINGER\n");

    do
    {
        printf("%d/7\n", response);
        response = enrollNewUser(newUserID);
        // if(response > previous_response)
    } while (response !=7);

    printf("USER ID = %d\n", newUserID);

    sprintf(username, "%d", newUserID);
    printf("Password : ");
    get_password(password, MAX_PASSWORD_LENGTH);

    FILE* signup_file = fopen(FILE_NAME, "a");
    if(signup_file == NULL)
    {
        printf("Error Occured while Logging in\n");
        return;
    }

    fprintf(signup_file, "%s %s\n", username, password); // Write username and password to file

    fclose(signup_file); // Close the file

}