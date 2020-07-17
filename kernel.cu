#include <iostream>
#include <cmath>
#include <iomanip>
#include <cstdlib>
#include <stdio.h>
#include <fstream>
#include <time.h>
#include <curand_kernel.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

using namespace std;

#define variations 2000

__global__ void simulation();
// we want all the params_all to be multiplied by everything in params_baseline

int main(void)
{

    double Vin = 0.36;
    double K1 = 0.02;
    double kp = 6;
    double Km = 13;

    double params_baseline = [Vin, k1, kp, Km];
    int n_params = 4;
    




}