#include <iostream>
using namespace std;

void tampilan_menu(string judul);
void tampilData(string nama[], int jumlah);


int main (){
	int pilih, jml = 3;
	string mahasiswa[3] = {"Anis", "Prabowo", "Ganjar"};
	tampilan_menu("Menu Utama");
	
	
	cout << "1. Tampil Data " << endl;
	cout << "2. Input data " << endl;
	cout << "3. Hitung Data " << endl;
	cout << "Masukan Pilihan : "; cin >> pilih;
	switch(pilih){
		case 1 :
		 tampilData(mahasiswa, jml);
	}
}

void tampilan_menu(string judul){
	cout << "==========================================" << endl;
	cout << " 			     " << judul << "           "<< endl;
	cout << "==========================================" << endl;
	cout << endl;
}

void tampilData(string nama[], int jumlah){
	for (int i = 0; i < jumlah; i++){
			cout << nama[i] << endl;
		}
}
