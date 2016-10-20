using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
			var host = new WebHostBuilder()
				.UseKestrel()
				.UseUrls("http://*:5000/")
				.UseStartup<Startup>()
				.Build();

			host.Run();
        }
    }

	public class Startup
	{
		public void Configure(IApplicationBuilder app)
		{
			app.Run(context =>
			{
				return context.Response.WriteAsync(string.Format("<h1>Polynomial</h1><p>Hello from ASP.NET Core and Docker!</p><p>It is currently: {0}</p>", DateTime.Now));
			});
		}
	}
}
