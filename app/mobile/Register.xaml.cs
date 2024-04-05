using System;
using System.Collections.Generic;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace mobile
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Register : ContentPage
    {

        private RequestWorker RqWorker;
        private string userName;
        private string pass;
        private string Mail;
        private string comPass;
        public Register()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            this.RqWorker = new RequestWorker();
            InitializeComponent();
        }
        private void Login_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Login());
        }

        private void Regsiter_Clicked(object sender, EventArgs e)
        {

            this.userName = username.Text != null ? username.Text : "";
            this.pass = password.Text != null ? password.Text : "";
            this.comPass = comPassword.Text != null ? comPassword.Text : "";
            this.Mail = mail.Text != null ? mail.Text : "";
            string error = "";
            if (this.userName.Length > 15 || this.userName.Length < 6)
            {
                error += "🔴 slapyvardį turi sudaryti 6-15 simboliai \n";




            }
            if (this.pass.Length > 15 || this.pass.Length < 8)
            {
                error += "🔴 slaptažodį turi sudaryti 8-15 simboliai";




            }
            if (error.Length == 0)
            {
                int count = 0;
                try
                {
                    Dictionary<string, string> x = this.RqWorker.userRegister(this.userName, this.pass, this.comPass, this.Mail);
                    
                    foreach (string i in x.Keys)
                    {
                        if (x[i] == "green")
                        {
                            count += 1;
                        }
                        else
                        {
                            error += "\n🔴" + i;
                        }

                    }
                }
                catch
                {
                    DisplayAlert("Klaida", "Duomenų bazės klaida", "OK");
                }
                if (count==3)
                {

                    DisplayAlert("", "Sėkmingai užsiregistruota", "OK");
                    Navigation.PushAsync(new Login());
                    

                }
                else
                {

                    DisplayAlert("Klaida", error, "OK");
                }




            }
            else
            {
                DisplayAlert("Klaida", error, "OK");

            }
        }
    }
}