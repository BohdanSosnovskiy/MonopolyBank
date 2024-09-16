using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace HelloApp.Classes
{
    public class History : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected virtual void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public History() 
        {
        }

        private string _name_img;
        public string name_img
        {
            get
            {
                return _name_img;
            }
            set
            {
                _name_img = value;
                OnPropertyChanged();
            }
        }

        private string _text;
        public string Text 
        {
            get
            {
                return _text;
            }
            set
            {
                _text = value; 
                OnPropertyChanged();
            }
        }

        private int _cash;
        public int Cash
        {
            get
            {
                return _cash;
            }
            set
            {
                _cash = value;
                OnPropertyChanged();
            }
        }

        public bool isVisibleCash { get; set; }
    }
}
