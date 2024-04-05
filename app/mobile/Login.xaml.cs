using System;
using System.Collections.Generic;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace mobile
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Login : ContentPage
    {
        private RequestWorker RqWorker;
        
        private String userName;
        private String pass;
        public Login()
        {
            NavigationPage.SetHasNavigationBar(this, false);
            this.RqWorker = new RequestWorker();
            
            InitializeComponent();
        }
        protected override bool OnBackButtonPressed()
        {
            return true;
        }
        private void Login_Clicked(object sender, EventArgs e)
        {

            this.userName = username.Text != null ? username.Text : "";
            this.pass = password.Text != null ? password.Text : "";
            string error = "";
            if (this.userName.Length > 15 || this.userName.Length < 6)
            {
                error += "🔴 Netinkamas slapyvardis \n";




            }
            if (this.pass.Length > 15 || this.pass.Length < 8)
            {
                error += "🔴 Netinkamas slaptažodis";




            }
            if (error.Length==0)
            {
               
                    bool x = this.RqWorker.userLogin(this.userName, this.pass);
                    if (x == false)
                    {
                    DisplayAlert("Klaida", "Klaida prisijungiant", "OK");
                    
                   
                }
                    else
                    {
                        Dictionary<string, object> userInfo = this.RqWorker.getUserInfo(this.userName, this.pass);
                        Navigation.PushAsync(new main(new User(this.userName, this.pass, Convert.ToInt32(userInfo["id"]), Convert.ToInt32(userInfo["points"]))));
                    }

                



            }
            else
            {
                DisplayAlert("Klaida", error, "OK");
            }
        }

            private void Regsiter_Clicked(object sender, EventArgs e)
        {


            Navigation.PushAsync(new Register());
        }
    }
}