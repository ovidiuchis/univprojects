#include <iostream> 
#include <fstream> 
#include <string> 
#include <vector> 
using namespace std;
bool removable(vector<int> vecin, vector<int> cov); 
int max_removable(vector<vector<int> > vecins, vector<int> cov); 
vector<int> proc_1(vector<vector<int> > vecins, vector<int> cov); 
vector<int> proc_2(vector<vector<int> > vecins, vector<int> cov, int k); 
int cov_size(vector<int> cov); 
ifstream infile ("graful_ad.txt"); 
ofstream outfile ("culori.txt");

int main() 
{ 
 //Citire
 int C, N, n, i, j, k, K, p, q, r, s, min, edge, counter=0; 
 infile>>N; 
 vector< vector<int> > Graph; 
 for(i=0; i<N; i++) 
 { 
  vector<int> row; 
  for(j=0; j<N; j++) 
  { 
   infile>>edge; 
   row.push_back(edge); 
  } 
  Graph.push_back(row); 
 } 
  vector<vector<int> > KC; 
  vector<int> row1; 
  for(int i=0; i<C; i++) row1.push_back(1); 
  for(int i=0; i<C; i++) KC.push_back(row1); 
  for(int i=0; i<C; i++) KC[i][i]=0; 

  vector<vector<int> > graph; 
  vector<int> rowind; 
  for(int i=0; i<C*N; i++) rowind.push_back(0); 
  for(int i=0; i<C*N; i++) graph.push_back(rowind); 
  for(int i=0; i<C*N; i++) 
  for(int j=0; j<C*N; j++) 
  { 
   int i_G=i/C, i_KC=i%C, j_G=j/C, j_KC=j%C; 
   if((i_G==j_G) && (KC[i_KC][j_KC]==1)) graph[i][j]=1; 
   if((Graph[i_G][j_G]==1) && (i_KC==j_KC)) graph[i][j]=1; 
  } 

  n=N*C; K=n/C; k=n-K; 
 //Vecinii
 vector<vector<int> > vecins; 
 for(i=0; i<graph.size(); i++) 
 { 
  vector<int> vecin; 
  for(j=0; j<graph[i].size(); j++) 
  if(graph[i][j]==1) vecin.push_back(j); 
  vecins.push_back(vecin); 
 }


 bool found=false; 
 min=n+1; 
 vector<vector<int> > covs; 
 vector<int> allcov; 
 for(i=0; i<graph.size(); i++) 
 allcov.push_back(1); 
 for(i=0; i<allcov.size(); i++) 
 { 
  if(found) break; 
  counter++; cout<<counter<<". ";  outfile<<counter<<". "; 
  vector<int> cov=allcov; 
  cov[i]=0; 
  cov=proc_1(vecins,cov); 
  s=cov_size(cov); 
  if(s<min) min=s; 
  if(s<=k) 
  { 
   outfile<<"Colorare("<<n-s<<"): "; 
   for(j=0; j<cov.size(); j++) if(cov[j]==0) outfile<<"("<<j/C+1<<","<<j%C+1<<") "; 
   outfile<<endl; 
   covs.push_back(cov); 
   found=true; 
   break; 
  } 
  for(j=0; j<n-k; j++) 
  cov=proc_2(vecins,cov,j); 
  s=cov_size(cov); 
  if(s<min) min=s; 
  outfile<<"Colorare ("<<n-s<<"): "; 
  for(j=0; j<cov.size(); j++) if(cov[j]==0) outfile<<"("<<j/C+1<<","<<j%C+1<<") "; 
  outfile<<endl; 
  covs.push_back(cov); 
  if(s<=k){ found=true; break; } 
 } 
 //Intersectii
 for(p=0; p<covs.size(); p++) 
 { 
  if(found) break; 
  for(q=p+1; q<covs.size(); q++) 
  { 
   if(found) break; 
   counter++; cout<<counter<<". ";  outfile<<counter<<". "; 
   vector<int> cov=allcov; 
   for(r=0; r<cov.size(); r++) 
   if(covs[p][r]==0 && covs[q][r]==0) cov[r]=0; 
   cov=proc_1(vecins,cov); 
   s=cov_size(cov); 
   if(s<min) min=s; 
   if(s<=k) 
   { 
    outfile<<"Colorare("<<n-s<<"): "; 
    for(j=0; j<cov.size(); j++) if(cov[j]==0) outfile<<"("<<j/C+1<<","<<j%C+1<<") "; 
    outfile<<endl; 
    found=true; 
    break; 
   } 
   for(j=0; j<k; j++) 
   cov=proc_2(vecins,cov,j); 
   s=cov_size(cov); 
   if(s<min) min=s; 
   outfile<<"Colorare("<<n-s<<"): "; 
   for(j=0; j<cov.size(); j++) if(cov[j]==0) outfile<<"("<<j/C+1<<","<<j%C+1<<") "; 
   outfile<<endl; 
   if(s<=k){ found=true; break; } 
   } 
 } 

 return 0; 
}

bool removable(vector<int> vecin, vector<int> cov) 
{ 
 bool check=true; 
 for(int i=0; i<vecin.size(); i++) 
 if(cov[vecin[i]]==0) 
 { 
  check=false; 
  break; 
 } 
 return check; 
}

int max_removable(vector<vector<int> > vecins, vector<int> cov) 
{ 
 int r=-1, max=-1; 
 for(int i=0; i<cov.size(); i++) 
 { 
  if(cov[i]==1 && removable(vecins[i],cov)==true) 
  { 
   vector<int> temp_cov=cov; 
   temp_cov[i]=0; 
   int sum=0; 
   for(int j=0; j<temp_cov.size(); j++) 
   if(temp_cov[j]==1 && removable(vecins[j], temp_cov)==true) 
   sum++; 
   if(sum>max) 
   { 
    max=sum; 
    r=i; 
   } 
  } 
 } 
 return r; 
}

vector<int> proc_1(vector<vector<int> > vecins, vector<int> cov) 
{ 
 vector<int> temp_cov=cov; 
 int r=0; 
 while(r!=-1) 
 { 
  r= max_removable(vecins,temp_cov); 
  if(r!=-1) temp_cov[r]=0; 
 } 
 return temp_cov; 
}

vector<int> proc_2(vector<vector<int> > vecins, vector<int> cov, int k) 
{ 
 int count=0; 
 vector<int> temp_cov=cov; 
 int i=0; 
 for(int i=0; i<temp_cov.size(); i++) 
 { 
  if(temp_cov[i]==1) 
  { 
   int sum=0, index; 
   for(int j=0; j<vecins[i].size(); j++) 
   if(temp_cov[vecins[i][j]]==0) {index=j; sum++;} 
   if(sum==1 && cov[vecins[i][index]]==0) 
   { 
    temp_cov[vecins[i][index]]=1; 
    temp_cov[i]=0; 
    temp_cov=proc_1(vecins,temp_cov); 
    count++; 
   } 
   if(count>k) break; 
  } 
 } 
 return temp_cov; 
}

int cov_size(vector<int> cov) 
{ 
 int count=0; 
 for(int i=0; i<cov.size(); i++) 
 if(cov[i]==1) count++; 
 return count; 
}