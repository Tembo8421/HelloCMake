#include "config.h_"

#include <iostream>

#include "sayhello.h"
#include "sayfuck.h"
#include "logger.h"

using namespace std;

int main(){
    cout << "PROJ_VERSION= " << PROJECT_VERSION << endl;
    helloCMake::sayhello();
    helloCMake::sayfuck();
    cyl::Logger();
    return 0;
}
