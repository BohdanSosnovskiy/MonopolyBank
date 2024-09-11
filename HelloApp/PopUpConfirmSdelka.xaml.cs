using HelloApp.Classes;

namespace HelloApp;

public partial class PopUpConfirmSdelka : ContentPage
{
    public delegate void AccountHandler(string message);
    public event AccountHandler? Notify;

    public PopUpConfirmSdelka()
	{
		InitializeComponent();
        Loaded += Page_Loaded;

        var sdelka = PresetGame.link_PageObmen.sdelka;

        text_title.Text = $"Сделака с {sdelka.targetUserName}";

        var companysCurrent = PresetGame.link_GameMainPage.CurrentUser.Companys;
        var companysTarget = PresetGame.link_PageObmen.user_obmen.Companys;

        for(int l = 0; l < sdelka.currentUserCompany.Count; l++)
        {
            for (int i = 0; i < companysCurrent.Count; i++)
            {
                if(sdelka.currentUserCompany[l].Name == companysCurrent[i].Name)
                {
                    companysCurrent.RemoveAt(i);
                    break;
                }
            }
            companysTarget.Add(sdelka.currentUserCompany[l]);
        }

        for (int l = 0; l < sdelka.targetUserCompany.Count; l++)
        {
            for (int i = 0; i < companysCurrent.Count; i++)
            {
                if (sdelka.targetUserCompany[l].Name == companysTarget[i].Name)
                {
                    companysTarget.RemoveAt(i);
                    break;
                }
            }
            companysCurrent.Add(sdelka.targetUserCompany[l]);
        }

        PresetGame.link_PageObmen.user_obmen.Cash -= sdelka.targetSendingMoney;
        PresetGame.link_GameMainPage.CurrentUser.Cash -= sdelka.currentSendingMoney;

        PresetGame.link_PageObmen.user_obmen.Cash += sdelka.currentSendingMoney;
        PresetGame.link_GameMainPage.CurrentUser.Cash += sdelka.targetSendingMoney;

        PresetGame.link_GameMainPage.UpdateGUIData();
    }

    protected override bool OnBackButtonPressed()
    {
        Close();
        return true;
    }

    void Page_Loaded(object sender, EventArgs e)
    {
        // We only need this to fire once, so clean things up!
        Loaded -= Page_Loaded;

        // Call the animation
        PoppingIn();
    }

    public void PoppingIn()
    {
        var contentHeight = 400;

        // Начните с перевода контента под экраном или за его пределами.
        this.Content.TranslationY = contentHeight;

        // Анимируйте полупрозрачный фон, исчезая в поле зрения
        this.Animate("Background",
            callback: v => this.Background = new SolidColorBrush(Colors.Black.WithAlpha((float)v)),
            start: 0d,
            end: 0.7d,
            rate: 32,
            length: 350,
            easing: Easing.CubicOut,
            finished: (v, k) =>
                this.Background = new SolidColorBrush(Colors.Black.WithAlpha(0.2f)));

        // Также анимируйте контент, скользящий вверх из-под экрана.
        this.Animate("Content",
            callback: v => this.Content.TranslationY = (int)(contentHeight - v),
            start: 0,
            end: contentHeight,
            length: 500,
            easing: Easing.CubicInOut,
            finished: (v, k) => this.Content.TranslationY = 0);
    }

    public Task PoppingOut()
    {
        var done = new TaskCompletionSource();

        // Measure the content size so we know how much to translate
        var contentSize = this.Content.Measure(Window.Width, Window.Height, MeasureFlags.IncludeMargins);
        var windowHeight = 700;

        // Start fading out the background
        this.Animate("Background",
            callback: v => this.Background = new SolidColorBrush(Colors.Black.WithAlpha((float)v)),
            start: 0.7d,
            end: 0d,
            rate: 32,
            length: 350,
            easing: Easing.CubicIn,
            finished: (v, k) => this.Background = new SolidColorBrush(Colors.Black.WithAlpha(0.0f)));

        // Start sliding the content down below the bottom of the screen
        this.Animate("Content",
            callback: v => this.Content.TranslationY = (int)(windowHeight - v),
            start: windowHeight,
            end: 0,
            length: 500,
            easing: Easing.CubicInOut,
            finished: (v, k) =>
            {
                this.Content.TranslationY = windowHeight;
                // Important: Set our completion source to done!
                done.TrySetResult();
            });

        // We return the task so we can wait for the animation to finish
        return done.Task;
    }

    private async void TapGestureRecognizer_OnTapped(object sender, TappedEventArgs e)
    {
        await Close();
    }

    async Task Close()
    {
        Notify?.Invoke("Произошло действие");
        // Wait for the animation to complete
        await PoppingOut();
        PresetGame.link_PageObmen.LocalClose();
        // Navigate away without the default animation
        await Navigation.PopModalAsync(animated: false);
    }

}