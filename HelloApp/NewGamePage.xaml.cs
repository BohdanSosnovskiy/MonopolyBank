using HelloApp.Classes;
using System.Collections.ObjectModel;

namespace HelloApp;

public partial class NewGamePage : ContentPage
{
	public NewGamePage()
	{
		InitializeComponent();
	}

    private async void OnStartNewGame(object sender, EventArgs e)
    {
        PresetGame.username = Username.Text;
        PresetGame.CountCahsStart = Convert.ToInt32(CountCahsStart.Text);
        PresetGame.CountStartSum = Convert.ToInt32(CountStartSum.Text);

        User user = new User(PresetGame.username);
        PresetGame.Users = new ObservableCollection<User>();
        PresetGame.Users.Add(user);

        GameMainPage gameMainPage = new GameMainPage();
        gameMainPage.Title = "Новая игра";
        gameMainPage.CurrentUser = user;
        gameMainPage.CreateServer();

        await Navigation.PushAsync(gameMainPage, true);
    }
}