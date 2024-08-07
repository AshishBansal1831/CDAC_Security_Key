#include <gtk/gtk.h>
#include <stdio.h>
#include <string.h>

#define CREDENTIALS_FILE "credentials.txt"

// Function prototypes
static void on_signup_button_clicked(GtkButton *button, gpointer user_data);
static void on_login_button_clicked(GtkButton *button, gpointer user_data);
static void handle_signup(const char *username, const char *password);
static void validate_login(const char *username, const char *password);
static void on_exit_button_clicked(GtkButton *button, gpointer user_data);
static gboolean username_exists(const char *username);
static void show_option_dialog();
static void show_file_type_dialog();
static void show_encrypted_file_dialog();
static void on_encrypt_button_clicked(GtkButton *button, gpointer user_data);
static void on_decrypt_button_clicked(GtkButton *button, gpointer user_data);

// Global variables for GTK widgets
static GtkWidget *entry_username_signup;
static GtkWidget *entry_password_signup;
static GtkWidget *entry_username_login;
static GtkWidget *entry_password_login;
static GtkWidget *status_label;
static GtkWidget *notebook;

int main(int argc, char *argv[]) {
    GtkWidget *window;
    GtkWidget *signup_page;
    GtkWidget *login_page;

    gtk_init(&argc, &argv);

    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
    gtk_window_set_title(GTK_WINDOW(window), "Fortress in your Pocket");
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);
    gtk_window_set_resizable(GTK_WINDOW(window), TRUE);
    g_signal_connect(window, "destroy", G_CALLBACK(gtk_main_quit), NULL);

    notebook = gtk_notebook_new();
    gtk_container_add(GTK_CONTAINER(window), notebook);

    // Signup Page
    signup_page = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), signup_page, gtk_label_new("Signup"));

    GtkWidget *label_username_signup = gtk_label_new("Username:");
    gtk_box_pack_start(GTK_BOX(signup_page), label_username_signup, FALSE, FALSE, 5);

    entry_username_signup = gtk_entry_new();
    gtk_box_pack_start(GTK_BOX(signup_page), entry_username_signup, FALSE, FALSE, 5);

    GtkWidget *label_password_signup = gtk_label_new("Password:");
    gtk_box_pack_start(GTK_BOX(signup_page), label_password_signup, FALSE, FALSE, 5);

    entry_password_signup = gtk_entry_new();
    gtk_entry_set_visibility(GTK_ENTRY(entry_password_signup), FALSE);
    gtk_box_pack_start(GTK_BOX(signup_page), entry_password_signup, FALSE, FALSE, 5);

    GtkWidget *button_signup = gtk_button_new_with_label("Signup");
    gtk_box_pack_start(GTK_BOX(signup_page), button_signup, FALSE, FALSE, 5);
    g_signal_connect(button_signup, "clicked", G_CALLBACK(on_signup_button_clicked), NULL);

    GtkWidget *button_exit_signup = gtk_button_new_with_label("Exit");
    gtk_box_pack_start(GTK_BOX(signup_page), button_exit_signup, FALSE, FALSE, 5);
    g_signal_connect(button_exit_signup, "clicked", G_CALLBACK(on_exit_button_clicked), NULL);

    // Login Page
    login_page = gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_notebook_append_page(GTK_NOTEBOOK(notebook), login_page, gtk_label_new("Login"));

    GtkWidget *label_username_login = gtk_label_new("Username:");
    gtk_box_pack_start(GTK_BOX(login_page), label_username_login, FALSE, FALSE, 5);

    entry_username_login = gtk_entry_new();
    gtk_box_pack_start(GTK_BOX(login_page), entry_username_login, FALSE, FALSE, 5);

    GtkWidget *label_password_login = gtk_label_new("Password:");
    gtk_box_pack_start(GTK_BOX(login_page), label_password_login, FALSE, FALSE, 5);

    entry_password_login = gtk_entry_new();
    gtk_entry_set_visibility(GTK_ENTRY(entry_password_login), FALSE);
    gtk_box_pack_start(GTK_BOX(login_page), entry_password_login, FALSE, FALSE, 5);

    GtkWidget *button_login = gtk_button_new_with_label("Login");
    gtk_box_pack_start(GTK_BOX(login_page), button_login, FALSE, FALSE, 5);
    g_signal_connect(button_login, "clicked", G_CALLBACK(on_login_button_clicked), NULL);

    GtkWidget *button_exit_login = gtk_button_new_with_label("Exit");
    gtk_box_pack_start(GTK_BOX(login_page), button_exit_login, FALSE, FALSE, 5);
    g_signal_connect(button_exit_login, "clicked", G_CALLBACK(on_exit_button_clicked), NULL);

    status_label = gtk_label_new("");
    gtk_box_pack_start(GTK_BOX(login_page), status_label, FALSE, FALSE, 5);

    gtk_widget_show_all(window);
    gtk_main();

    return 0;
}

static void on_signup_button_clicked(GtkButton *button, gpointer user_data) {
    const gchar *username = gtk_entry_get_text(GTK_ENTRY(entry_username_signup));
    const gchar *password = gtk_entry_get_text(GTK_ENTRY(entry_password_signup));

    handle_signup(username, password);
}

static void on_login_button_clicked(GtkButton *button, gpointer user_data) {
    const gchar *username = gtk_entry_get_text(GTK_ENTRY(entry_username_login));
    const gchar *password = gtk_entry_get_text(GTK_ENTRY(entry_password_login));

    validate_login(username, password);
}

static void handle_signup(const char *username, const char *password) {
    if (username_exists(username)) {
        GtkWidget *dialog = gtk_message_dialog_new(
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

    FILE *file = fopen(CREDENTIALS_FILE, "a");
    if (file == NULL) {
        gtk_label_set_text(GTK_LABEL(status_label), "Error: Unable to open credentials file.");
        return;
    }

    fprintf(file, "%s %s\n", username, password);
    fclose(file);

    GtkWidget *dialog = gtk_message_dialog_new(
        GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
        GTK_DIALOG_DESTROY_WITH_PARENT,
        GTK_MESSAGE_INFO,
        GTK_BUTTONS_OK,
        "Signup successful! Redirecting to login..."
    );

    gtk_dialog_run(GTK_DIALOG(dialog));
    gtk_widget_destroy(dialog);

    gtk_notebook_set_current_page(GTK_NOTEBOOK(notebook), 1);
}

static void validate_login(const char *username, const char *password) {
    FILE *file = fopen(CREDENTIALS_FILE, "r");
    if (file == NULL) {
        gtk_label_set_text(GTK_LABEL(status_label), "Error: Unable to open credentials file.");
        return;
    }

    char stored_username[256];
    char stored_password[256];
    int valid = 0;

    while (fscanf(file, "%255s %255s", stored_username, stored_password) == 2) {
        if (strcmp(username, stored_username) == 0 && strcmp(password, stored_password) == 0) {
            valid = 1;
            break;
        }
    }

    fclose(file);

    if (valid) {
        GtkWidget *dialog = gtk_message_dialog_new(
            GTK_WINDOW(gtk_widget_get_toplevel(GTK_WIDGET(status_label))),
            GTK_DIALOG_DESTROY_WITH_PARENT,
            GTK_MESSAGE_INFO,
            GTK_BUTTONS_OK,
            "Successfully logged in!"
        );
        gtk_dialog_run(GTK_DIALOG(dialog));
        gtk_widget_destroy(dialog);

        show_option_dialog();
    } else {
        gtk_label_set_text(GTK_LABEL(status_label), "Invalid username or password.");
    }
}

static void show_option_dialog() {
    GtkWidget *dialog;
    GtkWidget *content_area;
    GtkWidget *button_encrypt;
    GtkWidget *button_decrypt;

    dialog = gtk_dialog_new_with_buttons("Choose Option",
                                         NULL,
                                         GTK_DIALOG_MODAL,
                                         NULL);

    content_area = gtk_dialog_get_content_area(GTK_DIALOG(dialog));

    button_encrypt = gtk_button_new_with_label("Encryption");
    g_signal_connect(button_encrypt, "clicked", G_CALLBACK(on_encrypt_button_clicked), dialog);
    gtk_box_pack_start(GTK_BOX(content_area), button_encrypt, TRUE, TRUE, 5);

    button_decrypt = gtk_button_new_with_label("Decryption");
    g_signal_connect(button_decrypt, "clicked", G_CALLBACK(on_decrypt_button_clicked), dialog);
    gtk_box_pack_start(GTK_BOX(content_area), button_decrypt, TRUE, TRUE, 5);

    gtk_widget_show_all(dialog);
}

static void show_file_type_dialog() {
    GtkWidget *dialog;
    GtkFileFilter *filter;

    dialog = gtk_file_chooser_dialog_new("Select File Type",
                                         NULL,
                                         GTK_FILE_CHOOSER_ACTION_OPEN,
                                         "_Cancel",
                                         GTK_RESPONSE_CANCEL,
                                         "_Select",
                                         GTK_RESPONSE_ACCEPT,
                                         NULL);

    filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "All Files");
    gtk_file_filter_add_pattern(filter, "*");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);

    filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Text Files");
    gtk_file_filter_add_pattern(filter, "*.txt");
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

    gint result = gtk_dialog_run(GTK_DIALOG(dialog));
    if (result == GTK_RESPONSE_ACCEPT) {
        char *filename = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(dialog));
        g_print("Selected file: %s\n", filename);
        g_free(filename);
    }

    gtk_widget_destroy(dialog);
}

static void show_encrypted_file_dialog() {
    GtkWidget *dialog;
    GtkFileFilter *filter;

    dialog = gtk_file_chooser_dialog_new("Select Encrypted File",
                                         NULL,
                                         GTK_FILE_CHOOSER_ACTION_OPEN,
                                         "_Cancel",
                                         GTK_RESPONSE_CANCEL,
                                         "_Select",
                                         GTK_RESPONSE_ACCEPT,
                                         NULL);

    filter = gtk_file_filter_new();
    gtk_file_filter_set_name(filter, "Encrypted Files");
    gtk_file_filter_add_pattern(filter, "*.enc");
    gtk_file_chooser_add_filter(GTK_FILE_CHOOSER(dialog), filter);

    gint result = gtk_dialog_run(GTK_DIALOG(dialog));
    if (result == GTK_RESPONSE_ACCEPT) {
        char *filename = gtk_file_chooser_get_filename(GTK_FILE_CHOOSER(dialog));
        g_print("Selected encrypted file: %s\n", filename);
        g_free(filename);
    }

    gtk_widget_destroy(dialog);
}

static void on_encrypt_button_clicked(GtkButton *button, gpointer user_data) {
    GtkWidget *dialog = (GtkWidget *)user_data;
    gtk_widget_destroy(dialog);
    show_file_type_dialog();
}

static void on_decrypt_button_clicked(GtkButton *button, gpointer user_data) {
    GtkWidget *dialog = (GtkWidget *)user_data;
    gtk_widget_destroy(dialog);
    show_encrypted_file_dialog();
}

static gboolean username_exists(const char *username) {
    FILE *file = fopen(CREDENTIALS_FILE, "r");
    if (file == NULL) {
        return FALSE;
    }

    char stored_username[256];
    while (fscanf(file, "%255s", stored_username) == 1) {
        if (strcmp(username, stored_username) == 0) {
            fclose(file);
            return TRUE;
        }
    }

    fclose(file);
    return FALSE;
}

static void on_exit_button_clicked(GtkButton *button, gpointer user_data) {
    gtk_main_quit();
}

