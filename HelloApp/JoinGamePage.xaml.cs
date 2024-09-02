using HelloApp.Classes;
using Microsoft.Maui.Controls.PlatformConfiguration;
using System.Collections.ObjectModel;

namespace HelloApp;

public partial class JoinGamePage : ContentPage
{
	public JoinGamePage()
	{
		InitializeComponent();
	}

    private async void OnStartJoinGame(object sender, EventArgs e)
    {
        string ip = Ipserver.Text;

        PresetGame.username = username.Text;

        User user = new User(PresetGame.username);
        PresetGame.Users = new ObservableCollection<User>();
        PresetGame.Users.Add(user);

        GameMainPage gameMainPage = new GameMainPage();
        gameMainPage.Title = "Новая игра";
        gameMainPage.CurrentUser = user;
        gameMainPage.ConnectServer(ip);

        await Navigation.PushAsync(gameMainPage, true);
    }
}