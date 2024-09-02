using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace HelloApp.Classes
{
    public class User : INotifyPropertyChanged
    {
        public string Id { get; set; }
        public string Name { get; set; }
        private int cash_user;
        public int Cash 
        {
            get => cash_user;
            set 
            {
                cash_user = value;
                OnPropertyChanged();
            } 
        }
        public ObservableCollection<Company> Companys { get; set; }
        public string ImgPath {  get; set; } = "user.png";

        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public ICommand SelectUser { get; set; }

        public User(string username) 
        {
            Id = GenerateId();
            Name = username;
            Cash = PresetGame.CountCahsStart;
            Companys = new ObservableCollection<Company>();

            SelectUser = new Command(async p =>
            {
                User user = PresetGame.link_GameMainPage.getCurrentUser();

                await PresetGame.link_GameMainPage.Navigation.PushModalAsync(new PopUpInfoUser(user), false);
            });
        }

        private string GenerateId()
        {
            string alf = "1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik9ol0p";
            string result = "";
            for(int i = 0; i < 8; i++)
            {
                Random r = new Random();
                result += alf[r.Next(0, alf.Length - 1)];
            }
            return result;
        }
    }
}
