using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace HelloApp.Classes
{
    public class Sdelka : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public Sdelka(User user) 
        {
            currentUser = PresetGame.link_GameMainPage.CurrentUser;
            currentUserName = currentUser.Name;
            targetUser = user;
            targetUserName = targetUser.Name;
            textButton = "Заключить сделку";
            UpdateUser_Info();
        }
        private int _currentSendingMoney;
        public void SetCurrentSendingMoney(int value)
        {
            _currentSendingMoney = value;
            OnPropertyChanged("currentSendingMoney");
        }
        public int currentSendingMoney
        {
            get
            {
                return _currentSendingMoney;
            }
            set
            {
                _currentSendingMoney = Convert.ToInt32(value);
                OnPropertyChanged();
                UpdateUser_Info();
                var main = PresetGame.link_GameMainPage;
                main.SendMessageAsync(main.Writer, $"UpdateCSM|{targetUserName},{value}");
                
            }
        }

        public void SetTargetSendingMoney(int value)
        {
            _targetSendingMoney = value;
            OnPropertyChanged("targetSendingMoney");
        }

        private int _targetSendingMoney;
        public int targetSendingMoney
        {
            get
            {
                return _targetSendingMoney;
            }
            set
            {
                _targetSendingMoney = Convert.ToInt32(value);
                OnPropertyChanged();
                UpdateUser_Info();
                var main = PresetGame.link_GameMainPage;
                main.SendMessageAsync(main.Writer, $"UpdateTSM|{targetUserName},{value}");
                
            }
        }
        public string currentUserName { get; set; }
        public string targetUserName { get; set; }
        private string _textButton;
        public string textButton
        {
            get { return _textButton; }
            set 
            {
                _textButton = value;
                OnPropertyChanged();
            }
        }
        public User currentUser { get; set; }
        public User targetUser { get; set; }

        public List<Company> currentUserCompany { get; set; }
        public List<Company> targetUserCompany { get; set; }

        private int _currentUser_Sum;
        public int currentUser_Sum
        {
            get
            {
                return _currentUser_Sum;
            }
            set
            {
                _currentUser_Sum = value;
                OnPropertyChanged();
            }
        }

        private bool _isRC;
        private bool _isRT;
        public bool _isReadyCurrent
        {
            get
            {
                return _isRC;
            }
            set 
            {
                _isRC = value;
                OnPropertyChanged("isReadyCurrent");
            }
        }

        public bool _isReadyTarget
        {
            get
            {
                return _isRT;
            }
            set
            {
                _isRT = value;
                OnPropertyChanged("isReadyTarget");
            }
        }


        public string isReadyCurrent
        {
            get
            {
                if (_isReadyCurrent)
                {
                    return "Готов";
                }
                else
                {
                    return "Не готов";
                }
            }
        }

        public string isReadyTarget
        {
            get
            {
                if (_isReadyTarget)
                {
                    return "Готов";
                }
                else
                {
                    return "Не готов";
                }
            }
        }


        private int _targetUser_Sum;
        public int targetUser_Sum
        {
            get
            {
                return _targetUser_Sum;
            }
            set
            {
                _targetUser_Sum = value;
                OnPropertyChanged();
            }
        }

        public void UpdateUser_Info()
        {

            currentUserCompany = new List<Company>();
            currentUser_Sum = 0;
            targetUser_Sum = 0;
            var list = currentUser.Companys;
            foreach (var company in list)
            {
                if (company.Sdelka)
                {
                    currentUser_Sum += company.Price;
                    currentUserCompany.Add(company);
                }
            }
            currentUser_Sum += currentSendingMoney;

            targetUserCompany = new List<Company>();
           
            var listUser = targetUser.Companys;
            foreach (var company in listUser)
            {
                if (company.Sdelka)
                {
                    targetUser_Sum += company.Price;
                    targetUserCompany.Add(company);
                }
            }
            targetUser_Sum += targetSendingMoney;
        }
    }
}
