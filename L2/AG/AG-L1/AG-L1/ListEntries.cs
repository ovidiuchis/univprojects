using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AG_L1
{
    class ListEntries
    {
        public List<int> entries;

        public ListEntries(){
            entries = new List<int>();
        }


        public void addEntry(int e)
        {
            entries.Add(e);
        }
        public int getEntryAt(int index)
        {
            return entries[index];
        }

        public int size(){
            return entries.Count;
        }

    }
}
