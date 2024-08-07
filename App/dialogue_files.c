#include <gtk/gtk.h>   // GTK+ header for GUI functions
#include <stdio.h>     // Standard I/O library for file operations
#include <string.h>    // String library for string operations

#define CREDENTIALS_FILE "credentials.txt" // File to store credentials

// Function prototypes
static void on_signup_button_clicked(GtkButton *button, gpointer user_data);
static void on_login_button_clicked(GtkButton *button, gpointer user_data);
static void handle_signup(const char *username, const char *password);
static void validate_login(const char *username, const char *password);
static void on_exit_button_clicked(GtkButton *button, gpointer user_data);
static gboolean username_exists(const char *username);
static void show_file_type_dialog();

// Global variables for GTK widgets
static GtkWidget *entry_username_signup;  // Entry widget for username on signup page
static GtkWidget *entry_password_signup;  // Entry widget for password on signup page
static GtkWidget *entry_username_login;   // Entry widget for username on login page
static GtkWidget *entry_password_login;   // Entry widget for password on login page
static GtkWidget *status_label;            // Label to display status messages
static GtkWidget *notebook;                // Notebook widget to switch between pages

int main(int argc, char *argv[]) 
{
    GtkWidget *window;      // Main application window
    GtkWidget *signup_page; // Widget for the signup page
    GtkWidget *login_page;  // Widget for the login page

    // Initialize GTK
    gtk_init(&argc, &argv);

    // Create the main window and setting its properties
    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Fortress in you Pocket"); // Set window title
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);    // Set default window size
    gtk_window_set_resizable(GTK_WINDOW(window), TRUE);
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL); // Connect destroy signal to exit GTK main loop

    // Create a notebook widget to allow switching between signup and login pages
    notebook = gtk_notebook_new();
    gtk_container_add(GTK_CONTAINER(window), notebook); // Add notebook to the main window

    // Signup Page
    signup_page = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5); // Create a vertical box for layout
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), signup_page, gtk_label_new("Signup")); // Add signup page to notebook

    // Create and add widgets for signup page
    GtkWidget *label_username_signup = gtk_label_new("Username:"); // Create a label for username
    gtk_box_pack_start(GTK_BOX(signup_page), label_username_signup, FALSE, FALSE, 5); // Add label to vertical box

    entry_username_signup = gtk_entry_new(); // Create an entry widget for username
    gtk_box_pack_start(GTK_BOX(signup_page), entry_username_signup, FALSE, FALSE, 5); // Add entry to vertical box

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

    // Login Page
    login_page = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5); // Create a vertical box for layout
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), login_page, gtk_label_new("Login")); // Add login page to notebook

    // Create and add widgets for login page
    GtkWidget *label_username_login = gtk_label_new("Username:"); // Create a label for username
    gtk_box_pack_start(GTK_BOX(login_page), label_username_login, FALSE, FALSE, 5); // Add label to vertical box

    entry_username_login = gtk_entry_new(); // Create an entry widget for username
    gtk_box_pack_start(GTK_BOX(login_page), entry_username_login, FALSE, FALSE, 5); // Add entry to vertical box

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

    gtk_widget_show_all(window); // Show all widgets
    gtk_main(); // Enter the GTK main loop

    return 0; // Return from main
}

// Callback function for signup button click
static void on_signup_button_clicked(GtkButton *button, gpointer user_data) {
    const gchar *username = gtk_entry_get_text(GTK_ENTRY(entry_username_signup)); // Get username from entry
    const gchar *password = gtk_entry_get_text(GTK_ENTRY(entry_password_signup)); // Get password from entry

    handle_signup(username, password); // Handle signup
}

// Callback function for login button click
static void on_login_button_clicked(GtkButton *button, gpointer user_data) {
    const gchar *username = gtk_entry_get_text(GTK_ENTRY(entry_username_login)); // Get username from entry
    const gchar *password = gtk_entry_get_text(GTK_ENTRY(entry_password_login)); // Get password from entry

    validate_login(username, password); // Validate login
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

    FILE *file = fopen(CREDENTIALS_FILE, "a"); // Open credentials file in append mode
    
    if (file == NULL) 
    {
        gtk_label_set_text(GTK_LABEL(status_label), "Error: Unable to open credentials file."); // Display error if file cannot be opened
        return;
    }

    fprintf(file, "%s %s\n", username, password); // Write username and password to file
    fclose(file); // Close the file

    // Display success dialog
    GtkWidget *dialog = gtk_message_dialog_new
    (
        GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
        GTK_DIALOG_DESTROY_WITH_PARENT,
        GTK_MESSAGE_INFO,
        GTK_BUTTONS_OK,
        "Signup successful! Redirecting to login..."
    );

    gtk_dialog_run(GTK_DIALOG(dialog));
    gtk_widget_destroy(dialog);

    // Switch to login page
    gtk_notebook_set_current_page(GTK_NOTEBOOK(notebook), 1); // Switch to login page
}

// Function to validate user login
static void validate_login(const char *username, const char *password) 
{
    FILE *file = fopen(CREDENTIALS_FILE, "r"); // Opening file in read mode
    
    if (file == NULL) 
    {
        gtk_label_set_text(GTK_LABEL(status_label), "Error: Unable to open credentials file."); // Display error if file not opened
        return;
    }

    char stored_username[256]; // Buffer to store usernames read from the file
    char stored_password[256]; // Buffer to store passwords read from the file
    int valid = 0; // Flag to indicate if the login is valid

    while (fscanf(file, "%255s %255s", stored_username, stored_password) == 2) 
    { // Read username and password from file
        if (strcmp(username, stored_username) == 0 && strcmp(password, stored_password) == 0) 
        { // Check if credentials match
            valid = 1; // Set valid flag
            break; // Exit loop if match found
        }
    }

    fclose(file); // Close the file

    if (valid) 
    {
        // Display success dialog
        GtkWidget *dialog = gtk_message_dialog_new(
            GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
            GTK_DIALOG_DESTROY_WITH_PARENT,
            GTK_MESSAGE_INFO,
            GTK_BUTTONS_OK,
            "Successfully logged in!"
        );
        gtk_dialog_run(GTK_DIALOG(dialog));
        gtk_widget_destroy(dialog);

        // Close login window
        gtk_widget_destroy(GTK_WIDGET(gtk_widget_get_toplevel(GTK_WIDGET(status_label))));

        // Show file type selection dialog
        show_file_type_dialog();
    } 
    else 
    {
        gtk_label_set_text(GTK_LABEL(status_label), "Invalid username or password."); // Display error message
    }
}

// Function to show file type selection dialog
static void show_file_type_dialog() 
{
    GtkWidget *dialog;
    GtkFileFilter *filter;

    // Create a file chooser dialog
    dialog = gtk_file_chooser_dialog_new("Select File Type",
                                         NULL,
                                         GTK_FILE_CHOOSER_ACTION_OPEN,
                                         "_Cancel",
                                         GTK_RESPONSE_CANCEL,
                                         "_Select",
                                         GTK_RESPONSE_ACCEPT,
                                         NULL);

    // Add filters for common file types
    filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "All Files");
    gtk_file_filter_add_pattern(filter, "*");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);

    filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Text Files");
    gtk_file_filter_add_pattern(filter, "*.txt");
    gtk_file_filter_add_pattern(filter, "*.text");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);

    filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Word Files");
    gtk_file_filter_add_pattern(filter, "*.doc");
    gtk_file_filter_add_pattern(filter, "*.docx");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);

    filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Excel Files");
    gtk_file_filter_add_pattern(filter, "*.xls");
    gtk_file_filter_add_pattern(filter, "*.xlsx");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);

    // Run the dialog and handle the response
    gint result = gtk_dialog_run(GTK_DIALOG(dialog));
    if (result == GTK_RESPONSE_ACCEPT) 
    {
        char *filename = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(dialog));
        g_print("Selected file: %s\n", filename);
        g_free(filename);
    }

    gtk_widget_destroy(dialog);
}

// Function to check if the username already exists in the file
static gboolean username_exists(const char *username) 
{
    FILE *file = fopen(CREDENTIALS_FILE, "r"); // Open credentials file in read mode
    
    if (file == NULL)
    {
        return FALSE; // Return FALSE if file cannot be opened
    }

    char stored_username[256]; // Buffer to store usernames read from the file
    while (fscanf(file, "%255s", stored_username) == 1) 
    { // Read username from file
        if (strcmp(username, stored_username) == 0)
        { // Check if username matches
            fclose(file); // Close the file
            return 1; // Return TRUE if username exists
        }
    }

    fclose(file); // Close the file
    return 0; // Return FALSE if username does not exist
}

static void on_exit_button_clicked(GtkButton *button, gpointer user_data) 
{
    gtk_main_quit(); // Exit the GTK main loop and close the application
}

