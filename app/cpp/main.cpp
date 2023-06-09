#include <iostream>
#include <fstream>
#include <string>
#include "C:\Program Files\MySQL\MySQL Server 8.0\include\mysql.h"

int main() {
    MYSQL* connection = mysql_init(nullptr);
    
    if (connection == nullptr) {
        std::cerr << "Error al inicializar la conexión: " << mysql_error(connection) << std::endl;
        return 1;
    }
    
    if (!mysql_real_connect(connection, "localhost", "root", "root", "colormax", 3306, nullptr, 0)) {
        std::cerr << "Error al conectar a la base de datos: " << mysql_error(connection) << std::endl;
        mysql_close(connection);
        return 1;
    }
    
    std::string directory = "C:/Users/xdpor/OneDrive/Documentos/Colormax/app/db/";
    std::string files[] = {"create_db.sql", "create_tables.sql", "insert_data.sql"};
    
    for (const auto& file : files) {
        std::string filePath = directory + file;
        std::ifstream sqlFile(filePath);
        
        if (!sqlFile) {
            std::cerr << "Error al abrir el archivo: " << filePath << std::endl;
            continue;
        }
        
        std::string query((std::istreambuf_iterator<char>(sqlFile)), std::istreambuf_iterator<char>());
        if (mysql_query(connection, query.c_str()) != 0) {
            std::cerr << "Error al ejecutar la consulta: " << mysql_error(connection) << std::endl;
            sqlFile.close();
            continue;
        }
        
        std::cout << "Archivo ejecutado correctamente: " << filePath << std::endl;
        sqlFile.close();
    }
    
    mysql_close(connection);
    
    return 0;
}


