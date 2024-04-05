using System;
using System.Collections.Generic;
using System.Net;
using System.Collections.Specialized;
using Newtonsoft.Json;

namespace mobile {
    public class RequestWorker
    {
        private String baseUri;

        public RequestWorker()
        {

            UrlGetter getter = new UrlGetter();
            this.baseUri = getter.getUrl();



        }
        public void CorrectAnswer(String username, String password, int userID, int questionID)
        {

            Uri uri = new Uri(this.baseUri + "RequestApi/UserInfo.php");




            using (WebClient client = new WebClient())
            {

                byte[] response = client.UploadValues(uri, new NameValueCollection()
            {
                { "username",username },
                { "password",password },
           { "userID", userID.ToString() },
           { "questionID", questionID.ToString() },

            });








            }
        }

        public List<Dictionary<string, object>> getQuestions(String username, String password, int userID)
        {


            Uri uri = new Uri(this.baseUri + "RequestApi/UserInfo.php");




            using (WebClient client = new WebClient())
            {

                byte[] response =
                client.UploadValues(uri, new NameValueCollection()
                {
                { "username",username },
                { "password",password },
           { "userID", userID.ToString() },


                });


                string result = System.Text.Encoding.UTF8.GetString(response);



                return JsonConvert.DeserializeObject<List<Dictionary<string, object>>>(result);
            }
        }

        public Dictionary<String, object> getUserInfo(String username, String password)
        {


            Uri uri = new Uri(this.baseUri + "RequestApi/UserInfo.php");




            using (WebClient client = new WebClient())
            {

                byte[] response =
                client.UploadValues(uri, new NameValueCollection()
                {
           { "username", username },
                { "password", password },

                });


                string result = System.Text.Encoding.UTF8.GetString(response);


                return JsonConvert.DeserializeObject<Dictionary<string, object>>(result);
            }
        }

        public Dictionary<String, String> userRegister(String username, String password, String comPassword, String mail)
        {







            Uri uri = new Uri(this.baseUri + "php/RegisterWorker.php");
            using (WebClient client = new WebClient())
            {

                byte[] response =
                client.UploadValues(uri, new NameValueCollection()
                {
           { "username", username },
           { "password", password },
           { "comPassword", comPassword },
           { "mail", mail },

                });


                string result = System.Text.Encoding.UTF8.GetString(response);


                return JsonConvert.DeserializeObject<Dictionary<string, string>>(result);
            }




        }


        public Boolean userLogin(String username, String password)
        {


            Uri uri = new Uri(this.baseUri + "php/LoginWorker.php");




            using (WebClient client = new WebClient())
            {

                byte[] response =
                client.UploadValues(uri, new NameValueCollection()
                {
           { "username", username },
           { "password", password },


                });


                string result = System.Text.Encoding.UTF8.GetString(response);


                return JsonConvert.DeserializeObject<Boolean>(result);
            }







        }
        public void websiteConnectivity()
        {
            var ping = new System.Net.NetworkInformation.Ping();

            var PingResult = ping.Send(this.baseUri);

            if (PingResult.Status != System.Net.NetworkInformation.IPStatus.Success) throw new Exception();
        }

    } }