using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace mobile
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Question : ContentPage
    {
        private User user;
        private RequestWorker RqWorker;
        private List<Dictionary<String,object>> questions;
        private Dictionary<String, object> currentQuestion;
        private int currentAnswer;
        private Random randomNumberGenerator;
        public Question(User user)
        {
            
            InitializeComponent();
            this.randomNumberGenerator = new Random();
            this.user = user;
            this.RqWorker = new RequestWorker();
            userName.Text = this.user.getUserName();
            this.questions = new List<Dictionary<String, object>>();
            points.Text = "⭐" + this.user.getPoints().ToString();
            this.currentAnswer = -1;
            updateQuestions();
            
           
        }

        private void setValues()
        {
            int randomNumber = this.randomNumberGenerator.Next( this.questions.Count);
            this.currentQuestion = this.questions[randomNumber];
            this.questions.RemoveAt(randomNumber);
            setColor(Color.Azure);
            
            question.Text = this.currentQuestion["question"].ToString();
            buttonA.Text = this.currentQuestion["A"].ToString();
            buttonB.Text = this.currentQuestion["B"].ToString();
            buttonC.Text = this.currentQuestion["C"].ToString();
        }
        private void setColor(Color color)
        {
            buttonA.BackgroundColor = color;
            buttonB.BackgroundColor= color;
            buttonC.BackgroundColor = color;


        }
        private void displayCorrect()
        {
            points.Text = "⭐"+this.user.getPoints().ToString();
            setColor(Color.Red);
            int answer = Convert.ToInt32(this.currentQuestion["answer"]);
            if (answer == 1)
            {
                buttonA.BackgroundColor = Color.Lime;
            }
            else if (answer == 2)
            {
                buttonB.BackgroundColor = Color.Lime;


            }
            else if(answer==3)
            {
                buttonC.BackgroundColor = Color.Lime;

            }
            this.currentAnswer = -1;


        }
        private void buttonA_Clicked(object sender, EventArgs e)
        {
            setColor(Color.Azure);
            var button = (Button)sender;
            button.BackgroundColor = Color.Lime;
            this.currentAnswer = 1;
        }
        private void buttonB_Clicked(object sender, EventArgs e)
        {
            setColor(Color.Azure);
            var button = (Button)sender;
            button.BackgroundColor = Color.Lime;
            this.currentAnswer = 2;
        }
        private void buttonC_Clicked(object sender, EventArgs e)
        {
            setColor(Color.Azure);
            var button = (Button)sender;
            button.BackgroundColor = Color.Lime;
            this.currentAnswer = 3;
        }
       
        private void updateQuestions()
        {
            if (this.questions.Count == 0)
            {
                try
                {
                    this.questions = this.RqWorker.getQuestions(this.user.getUserName(), this.user.getPassword(), this.user.getID());
                }
                catch
                {
                    DisplayAlert("Klaida", "Duomenų bazės klaida", "OK");
                }
            }
            if (this.questions.Count == 0)
            {
                this.currentAnswer = -1;
                setColor(Color.Azure);
                
                question.Text = "Atsakėte į visus klausimus";
                buttonA.Text = "";
                buttonB.Text = "";
                buttonC.Text = "";
                answer.IsEnabled = false;

            }
            else
            {

                setValues();

            }

        }
        private async void answer_Clicked(object sender, EventArgs e)
        {
            if (this.currentAnswer != -1)
            {
                if (this.currentAnswer == Convert.ToInt32(this.currentQuestion["answer"]))
                {

                    this.user.addPoint();
                    try
                    {
                        this.RqWorker.CorrectAnswer(this.user.getUserName(), this.user.getPassword(), this.user.getID(), Convert.ToInt32(this.currentQuestion["id"]));
                    }
                    catch
                    {
                        DisplayAlert("Klaida", "Duomenų bazės klaida", "OK");
                    }
                }
                displayCorrect();

                await Task.Delay(2000);


                updateQuestions();
            }
           
        }
    }
   
}