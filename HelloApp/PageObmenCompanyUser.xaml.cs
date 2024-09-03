using HelloApp.Classes;

namespace HelloApp;

public partial class PageObmenCompanyUser : ContentPage
{
	private User user_obmen { get; set; }
	public PageObmenCompanyUser(User user)
	{
		InitializeComponent();

		user_obmen = user;
        Carusel_CompanyObmenUser.BindingContext = user_obmen.Companys;
        Carusel_MyCompanys.BindingContext = PresetGame.link_GameMainPage.CurrentUser.Companys;
        Loaded += Page_Loaded;
    }

    void Page_Loaded(object sender, EventArgs e)
    {
        // We only need this to fire once, so clean things up!
        this.Loaded -= Page_Loaded;
        Carusel_CompanyObmenUser.ItemsSource = user_obmen.Companys;
        Carusel_MyCompanys.ItemsSource = PresetGame.link_GameMainPage.CurrentUser.Companys;
    }

    public Company getCurrentMyCompany()
    {
        return (Company)Carusel_MyCompanys.CurrentItem;
    }

    public Company getCurrentUserCompany()
    {
        return (Company)Carusel_CompanyObmenUser.CurrentItem;
    }
}