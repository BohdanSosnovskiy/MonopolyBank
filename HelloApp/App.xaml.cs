namespace HelloApp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new NavigationPage( new MainPage());
            RequestedThemeChanged += (s, e) => { Current.UserAppTheme = AppTheme.Light; };
        }
    }
}
