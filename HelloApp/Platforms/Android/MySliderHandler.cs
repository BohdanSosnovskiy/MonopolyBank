using Android.Widget;
using Microsoft.Maui.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HelloApp.Platforms.Android
{
    public class MySliderHandler : SliderHandler
    {
        protected override void ConnectHandler(SeekBar platformView)
        {
            base.ConnectHandler(platformView);
            platformView.SetOnTouchListener(new SliderListener());
        }
    }
}
