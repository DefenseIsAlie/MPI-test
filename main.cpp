#include <mpi.h>
#include <iostream>
#include <string>
using namespace std;

int main(int argc, char *argv[]){
    int *arr = new int[10];

    for (int i = 0; i < 10; i++)
    {
        arr[i] = 2*i;
    }

    MPI_Init(&argc, &argv);
    int myrank;
    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);

    string ans = "My Rank is ";
    ans+= to_string(myrank);
    ans+= ", ";

    for (int i = 0; i < 10; i++)
    {
        ans += to_string(arr[i]);
        ans += " ";
    }


    cout << ans << "\n";
    
    MPI_Finalize();
    return 0;
}