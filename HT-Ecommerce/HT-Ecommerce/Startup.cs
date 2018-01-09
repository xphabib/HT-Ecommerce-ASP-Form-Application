using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HT_Ecommerce.Startup))]
namespace HT_Ecommerce
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
