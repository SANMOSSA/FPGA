
	
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <stdlib.h>
using namespace std;
int BusquedaBinaria(int V[],int i,int j,int n)
{
    int m,suma,vm;
	int result = -1;
    while(i <=j)
    {
    	suma = i + j;
        m = (suma)>>1;
        //vm = m*4
        //vm = vm + V(puntero)
        vm = V[m];
        if(vm == n)
	        {
	            result = m;
	            break;//beq x0,x0,endwhile0
	        }
        else
	        {
	            if(n > vm)
	            {
	            	m += 1 ;
	                i= m;
				}
	            else
	            {
	            	m -= 1 ;
	                j= m;
				}
	            	
	        }
    }
    if(result == -1)
	{
    	i = 0 - i ; //sub i,x0,i
    	result = i;
    }
        
    return result;
    
}

void ordenar(int vector[],int n)
{
	n--; 
	int k,f,aux,resta,vf,vf1,suma;
	k=0;
	f=0;
	for (k = 0; k < n; k++)
	{
		resta = n - k;
		for (f = 0; f < resta; f++)
		{
			//vf = f*4
			//vf = vf + V(puntero)
			vf = vector[f] ;
			suma = f + 1;
			//vf1 = suma*4
			//vf1 = vf1 + V(puntero)
			vf1 = vector[suma];
			if (vf > vf1)
			{
				aux = vf;
				//vf = f*4
				//vf = vf + V(puntero)
				vector[f] = vf1;
				//vf1 = suma*4
				//vf1 = vf1 + V(puntero)
				vector[suma] = aux;
			}
			//f++
		}
		//k++	
	}
}

int divint(int A, int B)
{
	int contador = 0;
	while (A >= B)
		{
			contador++;
			A-=B;
		}
	return contador;
}

int mul (int x//x8, int y//x9)
{
	int acc = 0;//x18
	int i;//x19
	for (i = 0; i < y; i ++)
	{
		acc+=x;
	}
	return acc;
}

int pot (int x, int y)
{
	int acc = 1;
	int i;
	for (i = 0; i < y; i ++)
	{	
		acc = mul(acc,x);
	}
	return acc;
}

int pol (int x, int k[], int n)
{
	int resultado = 0;
	int potencia = 0;
	int i = 0;
	for (i = 0; i <= n; i++)
	{ 
		potencia  = pot(x,i);
		resultado += mul(k[i],potencia);
	}
	return resultado;	
}

int fact (int x)
{
	int acc = 1;
	int i = 1; //x19
	for (i = 1; i <= x; i++)
	{ 
		acc  = mul(acc,i);
	}
	return acc;	
}

int modint(int A, int B)
{	
	int div = divint(A,B);
	int mult = mul(B,div);
	int modulo = A - mult;
	return modulo;
}

int factrec (int x)
{
    if (x==0)
        return 1;
    else
    {	
    	int resta = x-1;
    	int facto = factrec(resta);
    	int multi = mul(x,facto);
    	return multi;
	}
         
}

main ()
{
int n = 5;
int k[n] = {3,2,1,2,6};	
ordenar(k,n);
for (int i = 0;i<5;i++)
	cout<<k[i]<<", ";
	
cout<<BusquedaBinaria(k,0,4,6);
cout<<divint(10,2)<<"\n";
cout<<mul(10,2)<<"\n";
cout<<pot(2,4)<<"\n";
cout<<pol(1,k,n)<<"\n";
cout<<fact(5)<<"\n";
cout<<factrec(5)<<"\n";
cout<<modint(10,3)<<"\n";
}


