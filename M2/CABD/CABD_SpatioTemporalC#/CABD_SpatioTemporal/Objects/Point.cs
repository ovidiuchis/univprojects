using System;
using System.Collections.Generic;
using System.Text;

namespace CABD_SpatioTemporal.Objects
{
    class Point
    {
        Double X;
        Double Y;
        DateTime timestamp;
        Int32 id;

        public Int32 Id
        {
            get
            {
                return id;
            }
            set
            {
                id = value;
            }
        }
        public Point()
        {
            this.timestamp = System.DateTime.Now;

        }
        public Point(Double x, Double y)
        {
            X = x;
            Y = y;
            this.timestamp = System.DateTime.Now;
        }

        public DateTime Timestamp
        {
            get
            {
                return timestamp;
            }
        }
        public Double x
        {
            set
            {
                X = value;
            }
            get
            {
                return X;
            }
        }
        public Double y
        {
            set
            {
                Y = value;
            }
            get
            {
                return Y;
            }
        }

        public override bool Equals(Object p)
        {
            Point p1 = (Point)p;
            return p1.x == this.x && p1.y == this.y;
        }

    }
}

