using HelloApp.Classes;

namespace HelloApp;

public partial class PopUpInfoUser : ContentPage
{
	public User User { get; set; }
	public PopUpInfoUser(User user)
	{
		InitializeComponent();
		User = user;
        Loaded += Page_Loaded;
        BaseInfo.BindingContext = User;
    }

    protected override bool OnBackButtonPressed()
    {
        Close();
        return true;
    }

    void Page_Loaded(object sender, EventArgs e)
    {
        // We only need this to fire once, so clean things up!
        this.Loaded -= Page_Loaded;

        // Call the animation
        PoppingIn();
    }

    public void PoppingIn()
    {
        var contentHeight = 400;

        // ������� � �������� �������� ��� ������� ��� �� ��� ���������.
        this.Content.TranslationY = contentHeight;

        // ���������� �������������� ���, ������� � ���� ������
        this.Animate("Background",
            callback: v => this.Background = new SolidColorBrush(Colors.Black.WithAlpha((float)v)),
            start: 0d,
            end: 0.7d,
            rate: 32,
            length: 350,
            easing: Easing.CubicOut,
            finished: (v, k) =>
                this.Background = new SolidColorBrush(Colors.Black.WithAlpha(0.2f)));

        // ����� ���������� �������, ���������� ����� ��-��� ������.
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
        var windowHeight = contentSize.Request.Height;

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
        // Wait for the animation to complete
        await PoppingOut();
        // Navigate away without the default animation
        await Navigation.PopModalAsync(animated: false);
    }
}