#include <gtk/gtk.h>   // GTK+ header for GUI functions
#include <stdio.h>     // Standard I/O library for file operations
#include <string.h>    // String library for string operations
#include <openssl/aes.h>  // AES encryption library
#include <openssl/rand.h> // Random number generator for AES key and IV
#include <openssl/evp.h>
#include <ctype.h>

#include "Login.h"


const char CREDENTIALS_FILE[] = "credentials.txt"; // File to store credentials
#define EN_CREDENTIALS_FILE "credentials.txt.enc" // File to store credentials

// AES encryption/decryption key and IV
#define AES_KEY_SIZE 256 // AES key size in bits
#define AES_IV_SIZE 16   // AES IV size in bytes


typedef struct {
    GtkWidget *number_label;
    GtkWidget *counter_label;
    GtkWidget *dialog;
    GtkWidget *window;
} AppWidgets;


// Function prototypes
static void on_signup(GtkButton *button, gpointer user_data);
static void on_login(GtkButton *button, gpointer user_data);
static void on_signup_button_clicked(GtkButton *button, gpointer user_data);
static void on_login_button_clicked(GtkButton *button, gpointer user_data);
static void handle_signup(const char *username, const char *password);
static void validate_login(const char *username, const char *password);
static void on_exit_button_clicked(GtkButton *button, gpointer user_data);
static gboolean username_exists(const char *username);
static void show_file_type_dialog();
static void show_encryption_dialog();
static void show_decryption_dialog();
static void encrypt_file(char *filename);
static void decrypt_file(char *filename);
static gboolean validate_password(const char *password);
void activate(GtkApplication *app, gpointer user_data);

static void show_waiting_for_usb_dialog();
gboolean SignUpDialogBox(gpointer dialog);
gboolean LoginFingerprintDiaBox(gpointer dialog) ;

// Global variables for GTK widgets
static GtkWidget *entry_username_signup;  // Entry widget for username on signup page
static GtkWidget *entry_password_signup;  // Entry widget for password on signup page
static GtkWidget *User_ID_Label;   // Entry widget for username on login page
static GtkWidget *entry_password_login;   // Entry widget for password on login page
static GtkWidget *status_label;           // Label to display status messages
static GtkWidget *notebook;               // Notebook widget to switch between pages
GtkWidget *activateWindow;

int current_value = 0;  // To keep track of the last received value
int argc;
char **argv;

GtkWidget *window;      // Main application window

// AES encryption key and IV
static unsigned char aes_key[AES_KEY_SIZE / 8];
static unsigned char aes_iv[AES_IV_SIZE];

int main(int argc_m, char *argv_m[]) 
{
     // Initialize GTK
    gtk_init(&argc_m, &argv_m);

    argc = argc_m;
    argv = argv_m;

    GtkApplication *app;
    int status;

    app = gtk_application_new("com.example.dialog", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);

    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return 0; // Return from main
}

void activate(GtkApplication *app, gpointer user_data) {
    
    GtkWidget *content_area;
    GtkWidget *login_button;
    GtkWidget *signup_button;
    GtkWidget *box;

    activateWindow = gtk_dialog_new_with_buttons("Login or Signup",
                                         GTK_WINDOW(user_data),
                                         GTK_DIALOG_MODAL,
                                         NULL,
                                         NULL);

    content_area = gtk_dialog_get_content_area(GTK_DIALOG(activateWindow));

    gtk_window_set_default_size(GTK_WINDOW(activateWindow), 300, 100); // Adjust width and height as needed

    gtk_window_set_position(GTK_WINDOW(activateWindow), GTK_WIN_POS_CENTER);

    // Create a box to hold the buttons
    box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_container_add(GTK_CONTAINER(content_area), box);

    // Create Login button
    login_button = gtk_button_new_with_label("Login");
    g_signal_connect(login_button, "clicked", G_CALLBACK(on_login), "Login");
    gtk_box_pack_start(GTK_BOX(box), login_button, TRUE, TRUE, 0);

    // Create Signup button
    signup_button = gtk_button_new_with_label("Signup");
    g_signal_connect(signup_button, "clicked", G_CALLBACK(on_signup), "Signup");
    gtk_box_pack_start(GTK_BOX(box), signup_button, TRUE, TRUE, 0);

    gtk_widget_show_all(activateWindow);

    gint result = gtk_dialog_run(GTK_DIALOG(activateWindow));

    // You can handle response here if needed
    switch (result) {
        case GTK_RESPONSE_OK:
            g_print("OK clicked\n");
            break;
        case GTK_RESPONSE_CANCEL:
            g_print("Cancel clicked\n");
            break;
        default:
            g_print("Dialog closed\n");
            break;
    }
}
uint8_t newID;

gboolean update_labels(AppWidgets *widgets) {
    int number = enrollNewUser(newID);  // Read from USB
    current_value = number;             // Update the current value
#ifdef DEBUG    
    printf("Number = %d\n", number);
#endif
    // Update the number label
    char number_text[40];
    snprintf(number_text, sizeof(number_text), "Number: %d", number);
    gtk_label_set_text(GTK_LABEL(widgets->number_label), number_text);

    // Update the counter label
    char counter_text[40];
    snprintf(counter_text, sizeof(counter_text), "%d/8", number);
    printf("%s\n", counter_text);
    gtk_label_set_text(GTK_LABEL(widgets->counter_label), counter_text);

    // Check if the number reaches 8, and if so, close the dialog and window
    if (current_value == 7) {
        gtk_widget_destroy(widgets->dialog);
        gtk_widget_destroy(widgets->window);
        return FALSE;  // Stop the timeout function
    }

    return TRUE;  // Continue the timeout function
}

gboolean newFingperPrintactivate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window;
    GtkWidget *dialog;
    GtkWidget *content_area;
    GtkWidget *number_label;
    GtkWidget *counter_label;
    GtkWidget *box;

    g_print("In newFingperPrintactivate\n");
    newID = getNewFingerprintID();

#ifdef DEBUG    
    g_print("New ID = %d\n", newID);
#endif    
    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Finger Placement");
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 100);

    dialog = gtk_dialog_new_with_buttons("Finger Placement",
                                         GTK_WINDOW(window),
                                         GTK_DIALOG_MODAL,
                                         NULL,
                                         GTK_RESPONSE_OK,
                                         NULL);

    content_area = gtk_dialog_get_content_area(GTK_DIALOG(dialog));

    // Create a box to hold the labels vertically
    box = gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_container_add(GTK_CONTAINER(content_area), box);

    // Create and add the number label
    number_label = gtk_label_new("Waiting for input...");
    gtk_box_pack_start(GTK_BOX(box), number_label, TRUE, TRUE, 0);

    // Create and add the counter label
    counter_label = gtk_label_new("0/8");
    gtk_box_pack_start(GTK_BOX(box), counter_label, TRUE, TRUE, 0);

    gtk_widget_show_all(dialog);

    // Create an AppWidgets structure to hold the pointers to widgets
    AppWidgets *widgets = g_malloc(sizeof(AppWidgets));
    widgets->number_label = number_label;
    widgets->counter_label = counter_label;
    widgets->dialog = dialog;
    widgets->window = window;

    // Update labels with USB input, pass the structure as a single argument
    g_timeout_add(250, (GSourceFunc)update_labels, widgets);

    gtk_dialog_run(GTK_DIALOG(dialog));
    
    gtk_widget_destroy(dialog);
    gtk_widget_destroy(window);
    g_free(widgets);  // Free the allocated structure
}

void SignUP_FP_Handling()
{
    GtkApplication *app;
    int status; 
    
    app = gtk_application_new("com.example.usbhandler", G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, "activate", G_CALLBACK(newFingperPrintactivate), NULL);

    status = g_application_run(G_APPLICATION(app), argc, argv);

    g_object_unref(app);
}

static void on_signup(GtkButton *button, gpointer user_data)
{
    gtk_widget_destroy(activateWindow);

    show_waiting_for_usb_dialog();

    SignUP_FP_Handling();
    GtkWidget *signup_page; // Widget for the signup page

    char UserID_str[] = "ID : %d";
    sprintf(UserID_str, UserID_str, newID);

    // Create the main window and setting its properties
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Sign-up"); // Set window title
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);    // Set default window size
    gtk_window_set_resizable(GTK_WINDOW(window), TRUE);
    gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER);							       //
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL); // Connect destroy signal to exit GTK main loop

    // Create a notebook widget to allow switching between signup and login pages
    notebook = gtk_notebook_new();
    gtk_container_add(GTK_CONTAINER(window), notebook); // Add notebook to the main window

    // Signup Page
    signup_page = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5); // Create a vertical box for layout
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), signup_page, gtk_label_new("Signup")); // Add signup page to notebook

    // Create and add widgets for signup page
    GtkWidget *label_username_signup = gtk_label_new(UserID_str); // Create a label for username
    gtk_box_pack_start(GTK_BOX(signup_page), label_username_signup, FALSE, FALSE, 5); // Add label to vertical box

    GtkWidget *label_password_signup = gtk_label_new("Password:"); // Create a label for password
    gtk_box_pack_start(GTK_BOX(signup_page), label_password_signup, FALSE, FALSE, 5); // Add label to vertical box

    entry_password_signup = gtk_entry_new(); // Create an entry widget for password
    gtk_entry_set_visibility(GTK_ENTRY(entry_password_signup), FALSE); // Hide password text
    gtk_box_pack_start(GTK_BOX(signup_page), entry_password_signup, FALSE, FALSE, 5); // Add entry to vertical box

    GtkWidget *button_signup = gtk_button_new_with_label("Signup"); // Create a signup button
    gtk_box_pack_start(GTK_BOX(signup_page), button_signup, FALSE, FALSE, 5); // Add button to vertical box
    g_signal_connect(button_signup, "clicked", G_CALLBACK(on_signup_button_clicked), NULL); // Connect button click signal to handler

    // Add Exit Button on Signup Page
    GtkWidget *button_exit_signup = gtk_button_new_with_label("Exit"); // Create an exit button
    gtk_box_pack_start(GTK_BOX(signup_page), button_exit_signup, FALSE, FALSE, 5); // Add exit button to vertical box
    g_signal_connect(button_exit_signup, "clicked", G_CALLBACK(on_exit_button_clicked), NULL); // Connect exit button to handler

    // Create a message dialog
    

    gtk_widget_show_all(window); // Show all widgets
    gtk_main(); // Enter the GTK main loop

}

static void on_login(GtkButton *button, gpointer user_data)
{
    gtk_widget_destroy(activateWindow);
    GtkWidget *login_page;  // Widget for the login page
    
    char UserID_str[10] ;

    sprintf(UserID_str, "ID : %d", 116);

    // Create the main window and setting its properties
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Login"); // Set window title
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);    // Set default window size
    gtk_window_set_resizable(GTK_WINDOW(window), TRUE);
    gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER);							       //
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL); // Connect destroy signal to exit GTK main loop

    // Create a notebook widget to allow switching between signup and login pages
    notebook = gtk_notebook_new();
    gtk_container_add(GTK_CONTAINER(window), notebook); // Add notebook to the main window

    // Login Page
    login_page = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5); // Create a vertical box for layout
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), login_page, gtk_label_new("Login")); // Add login page to notebook

    // Create and add widgets for login page
    GtkWidget *label_username_login = gtk_label_new(UserID_str); // Create a label for username
    gtk_box_pack_start(GTK_BOX(login_page), label_username_login, FALSE, FALSE, 5); // Add label to vertical box

    GtkWidget *label_password_login = gtk_label_new("Password:"); // Create a label for password
    gtk_box_pack_start(GTK_BOX(login_page), label_password_login, FALSE, FALSE, 5); // Add label to vertical box

    entry_password_login = gtk_entry_new(); // Create an entry widget for password
    gtk_entry_set_visibility(GTK_ENTRY(entry_password_login), FALSE); // Hide password text
    gtk_box_pack_start(GTK_BOX(login_page), entry_password_login, FALSE, FALSE, 5); // Add entry to vertical box

    GtkWidget *button_login = gtk_button_new_with_label("Login"); // Create a login button
    gtk_box_pack_start(GTK_BOX(login_page), button_login, FALSE, FALSE, 5); // Add button to vertical box
    g_signal_connect(button_login, "clicked", G_CALLBACK(on_login_button_clicked), NULL); // Connect button click signal to handler

    GtkWidget *button_exit_login = gtk_button_new_with_label("Exit"); // Create an exit button
    gtk_box_pack_start(GTK_BOX(login_page), button_exit_login, FALSE, FALSE, 5); // Add exit button to vertical box
    g_signal_connect(button_exit_login, "clicked", G_CALLBACK(on_exit_button_clicked), NULL); // Connect exit button to handler

    status_label = gtk_label_new(""); // Create a status label for displaying messages
    gtk_box_pack_start(GTK_BOX(login_page), status_label, FALSE, FALSE, 5); // Add status label to vertical box

    show_waiting_for_usb_dialog();
    
    gtk_widget_show_all(window); // Show all widgets
    gtk_main(); // Enter the GTK main loop
}

// Callback function for signup button click
static void on_signup_button_clicked(GtkButton *button, gpointer user_data) {
    // const gchar *username = gtk_entry_get_text(GTK_ENTRY(entry_username_signup)); // Get username from entry
    char username[10];
    sprintf(username, "%d", newID);
    const gchar *password = gtk_entry_get_text(GTK_ENTRY(entry_password_signup)); // Get password from entry
    // const gchar *password = gtk_entry_get_text(GTK_ENTRY(entry_password_signup)); // Get password from entry

    handle_signup(username, password); // Handle signup
}

// Callback function for login button click
static void on_login_button_clicked(GtkButton *button, gpointer user_data) {
#ifdef DEBUG
    printf("Goint to username\n");
#endif
    char username[10];
    sprintf(username, "%d", 2333);
    const gchar *password = gtk_entry_get_text(GTK_ENTRY(entry_password_login)); // Get password from entry

#ifdef DEBUG    
    printf("Goint to validate = %s\n", password);
#endif
    validate_login((gchar*)username, password); // Validate login
}

// Function to handle user signup
static void handle_signup(const char *username, const char *password) 
{
    // Check if the username already exists
    if (username_exists(username)) 
    {
        // Display success dialog
        GtkWidget *dialog = gtk_message_dialog_new
        (
            GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
            GTK_DIALOG_DESTROY_WITH_PARENT,
            GTK_MESSAGE_INFO,
            GTK_BUTTONS_OK,
            "Username already exists. Try another username."
        );
    
        gtk_dialog_run(GTK_DIALOG(dialog));
        gtk_widget_destroy(dialog);
        return;
    }
    printf("Coming Here\n");
    if (!validate_password(password)) 
    {
        // Display error dialog for invalid password
        GtkWidget *dialog = gtk_message_dialog_new(
            GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
            GTK_DIALOG_DESTROY_WITH_PARENT,
            GTK_MESSAGE_ERROR,
            GTK_BUTTONS_OK,
            "Password must be 8-12 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character, and must not start with a special character."
        );
        gtk_dialog_run(GTK_DIALOG(dialog));
        gtk_widget_destroy(dialog);
        return;
    }

    // decrypt_file(EN_CREDENTIALS_FILE);

    FILE *file = fopen(CREDENTIALS_FILE, "a"); // Open credentials file in append mode
    
    if (file == NULL) 
    {
        gtk_label_set_text(GTK_LABEL(status_label), "Error: Unable to open credentials file."); // Display error if file cannot be opened
        return;
    }

    fprintf(file, "%s %s\n", username, password); // Write username and password to file
    fclose(file); // Close the file

    // encrypt_file(CREDENTIALS_FILE);
    
    // Display success dialog
    GtkWidget *dialog = gtk_message_dialog_new
    (
        GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
        GTK_DIALOG_DESTROY_WITH_PARENT,
        GTK_MESSAGE_INFO,
        GTK_BUTTONS_OK,
        "Signup successful! You can now login."
    );
    
    gtk_dialog_run(GTK_DIALOG(dialog));
    gtk_widget_destroy(dialog);
}

// Function to validate the password based on specified rules
static gboolean validate_password(const char *password) 
{
    int length = strlen(password);
    if (length < 8 || length > 12) 
    {
        return FALSE;
    }

    if (!isalnum(password[0])) 
    {
        return FALSE;
    }

    gboolean has_upper = FALSE, has_lower = FALSE, has_digit = FALSE, has_special = FALSE;

    for (int i = 0; i < length; i++) 
    {
        if (isupper(password[i])) has_upper = TRUE;
        if (islower(password[i])) has_lower = TRUE;
        if (isdigit(password[i])) has_digit = TRUE;
        if (ispunct(password[i])) has_special = TRUE;
    }

    return has_upper && has_lower && has_digit && has_special;
}

// Function to validate user login
static void validate_login(const char *username, const char *password) 
{
    // decrypt_file(EN_CREDENTIALS_FILE);

    FILE *file = fopen(CREDENTIALS_FILE, "r"); // Open credentials file in read mode

    if (file == NULL) 
    {
        gtk_label_set_text(GTK_LABEL(status_label), "Error: Unable to open credentials file."); // Display error if file cannot be opened
        return;
    }

    char stored_username[256], stored_password[256]; // Buffers for storing username and password
    gboolean login_successful = FALSE; // Flag to track login success
#ifdef DEBUG
    printf("stored_password = %s\n", stored_password);
#endif
    // Read credentials from file and check if username and password match
    while (fscanf(file, "%255s %255s", stored_username, stored_password) == 2) 
    {
        if (strcmp(username, stored_username) == 0 && strcmp(password, stored_password) == 0) 
        {
            login_successful = TRUE; // Set flag if credentials match
            break;
        }
    }

    fclose(file); // Close the file

    // encrypt_file(CREDENTIALS_FILE);
#if 1 
    login_successful = TRUE;
#endif
    if (login_successful) 
    {
        show_file_type_dialog(); // Show options for encryption or decryption
    } 
    else 
    {
        // Display error dialog for incorrect username or password
        GtkWidget *dialog = gtk_message_dialog_new
        (
            GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
            GTK_DIALOG_DESTROY_WITH_PARENT,
            GTK_MESSAGE_ERROR,
            GTK_BUTTONS_OK,
            "Invalid username or password."
        );
        
        gtk_dialog_run(GTK_DIALOG(dialog));
        gtk_widget_destroy(dialog);
    }
}

// Function to check if a username already exists
static gboolean username_exists(const char *username) 
{

    // decrypt_file(EN_CREDENTIALS_FILE);
    
    FILE *file = fopen(CREDENTIALS_FILE, "r"); // Open credentials file in read mode

    if (file == NULL) 
    {
        return FALSE; // Return false if file cannot be opened
    }

    char stored_username[256], stored_password[256]; // Buffers for storing username and password

    // Read credentials from file and check if username exists
    while (fscanf(file, "%255s %255s", stored_username, stored_password) == 2) 
    {
        if (strcmp(username, stored_username) == 0) 
        {
            fclose(file); // Close the file
            return TRUE; // Return true if username exists
        }
    }

    fclose(file); // Close the file
		  
    // encrypt_file(CREDENTIALS_FILE);

    return FALSE; // Return false if username does not exist
}

// Callback function for exit button click
static void on_exit_button_clicked(GtkButton *button, gpointer user_data) 
{
    gtk_main_quit(); // Exit the GTK main loop
}

// Function to show options for encryption or decryption
static void show_file_type_dialog() 
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

// Function to show file chooser dialog for encryption
static void show_encryption_dialog() 
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
        GtkWidget *dialog = gtk_message_dialog_new
        (
        	NULL,
        	GTK_DIALOG_DESTROY_WITH_PARENT,
        	GTK_MESSAGE_INFO,
        	GTK_BUTTONS_OK,
        	"File encrypted successfully."
    	);
    	gtk_dialog_run(GTK_DIALOG(dialog));
    	gtk_widget_destroy(dialog);
    }

    gtk_widget_destroy(dialog); // Destroy the dialog
}

// Function to show file chooser dialog for decryption
static void show_decryption_dialog() 
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


static void show_waiting_for_usb_dialog() 
{
    GtkWidget* dialog = gtk_message_dialog_new(GTK_WINDOW(window),
                                    GTK_DIALOG_MODAL,
                                    GTK_MESSAGE_INFO,
                                    GTK_BUTTONS_NONE,
                                    "Waiting for USB device...");
     
    g_timeout_add_seconds(1, SignUpDialogBox, dialog);
    gtk_dialog_run(GTK_DIALOG(dialog));   
    gtk_widget_destroy(dialog); // Destroy the dialog immediately after it is run
}

// Function to check for USB and update the dialog
gboolean SignUpDialogBox(gpointer dialog) 
{
    if (confirmUSB()==EXIT_SUCCESS) {
        gtk_widget_destroy(GTK_WIDGET(dialog));
        return G_SOURCE_REMOVE;  // Stop the timeout source
        printf("Confirm Succes\n");
    }
    return G_SOURCE_CONTINUE;  // Continue checking
}

// Function to check for USB and update the dialog
gboolean LoginFingerprintDiaBox(gpointer dialog) 
{
    if (confirmUSB()==EXIT_SUCCESS) {
        gtk_widget_destroy(GTK_WIDGET(dialog));

        GtkWidget* fingeprint = gtk_message_dialog_new(GTK_WINDOW(window),
                                                        GTK_DIALOG_MODAL,
                                                        GTK_MESSAGE_INFO,
                                                        GTK_BUTTONS_NONE,
                                                        "Put your Finger on USB");
        
        gtk_dialog_run(GTK_DIALOG(fingeprint));
        gtk_widget_destroy(fingeprint); // Destroy the second dialog after it's dismissed
        return G_SOURCE_REMOVE;  // Stop the timeout source
    }

    return G_SOURCE_CONTINUE;  // Continue checking
}


