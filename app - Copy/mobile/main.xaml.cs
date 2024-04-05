using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace mobile
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class main : ContentPage
    {
        private User user;
        public main(User user)
        {
            this.user = user;
            NavigationPage.SetHasBackButton(this, false);
          
            InitializeComponent();
        }
        protected override bool OnBackButtonPressed()
        {
            return true;
        }

        private void Question_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Question(this.user));
        }
        private void Logout_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new Login());
        }
    }
}