using Android.Views;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Android.Views.View;

namespace HelloApp.Platforms.Android
{
    public class SliderListener : Java.Lang.Object, IOnTouchListener
    {
        public bool OnTouch(global::Android.Views.View v, MotionEvent e)
        {
            if (e.Action == MotionEventActions.Down || e.Action == MotionEventActions.Move)
            {
                v.Parent.RequestDisallowInterceptTouchEvent(true);
            }
            else
            {
                v.Parent.RequestDisallowInterceptTouchEvent(false);
            }
            return false;
        }
    }
}
