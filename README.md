# AI-Data-Engineer-Challenge- 📈
Este proyecto demuestra un pipeline de datos completo, de principio a fin, diseñado para transformar datos brutos de gasto en publicidad en métricas de negocio accionables. El proyecto utiliza un stack moderno para la ingesta de datos, el almacenamiento en un almacén de datos relacional y el modelado de métricas clave (KPIs) con SQL.  

El objetivo principal es responder a la pregunta de negocio: "¿Cómo cambió el rendimiento del marketing (medido por CAC y ROAS) entre los últimos 30 días y los 30 días anteriores?"  

## Estructura del Proyecto 📁
El proyecto está organizado en componentes modulares para cada fase del pipeline de datos:   
- n8n_workflow.json: El archivo que contiene el flujo de trabajo completo de ingesta de datos, desde la descarga del archivo CSV hasta la carga en la base de datos de PostgreSQL.  
- kpi_analysis.sql: El script SQL que realiza el análisis de los datos para calcular el CAC, el ROAS y las métricas de comparación.  
- docs/: Carpeta que tiene capturas de pantalla y diagramas del proyecto.  

## Tecnologías Utilizadas 🦾
- n8n Cloud: Para la ingesta y orquestación de datos. Es el orquestador sin código que gestiona el flujo de trabajo de ETL (Extraer, Transformar, Cargar).  
- Supabase: Un servicio de base de datos relacional que funciona como un Data Warehouse, optimizado para el almacenamiento y análisis de los datos.  
- SQL (PostgreSQL): El lenguaje de programación utilizado para el modelado de datos y el cálculo de los KPIs.  
- Google Drive: Como la fuente de datos externa que contiene el archivo CSV de ads_spend.  

## Instalación y Configuración ⚙️
- Clonar el Repositorio (Bash):  
git clone https://github.com/ADAA-404/AI-Data-Engineer-Challenge-.git   
cd AI-Data-Engineer-Challenge-

- Configurar la base de datos:
Crea una cuenta gratuita en Supabase y crea un nuevo proyecto de base de datos.  
Sigue las instrucciones para crear la tabla ads_spend_ingested con el script CREATE TABLE.  

- Configurar el flujo de n8n:
Importa el archivo n8n_workflow.json a tu espacio de trabajo de n8n Cloud.
Asegúrate de actualizar las credenciales del nodo de PostgreSQL con las credenciales de tu base de datos de Supabase.  

## Modo de Uso 📎
Este proyecto requiere los archivos proporcionados y la consideracion de sus propias credenciales para usar como lo es en el caso de la base de datos.

- Ingesta de Datos:
Asegúrate de que tu base de datos Supabase esté configurada y la tabla ads_spend_ingested exista.  
En n8n Cloud, haz clic en Execute Workflow para ejecutar el pipeline de ingesta. Esto descargará el CSV, transformará los datos e insertará las filas en tu base de datos.  

- Análisis de KPIs:
En el Editor de SQL de Supabase, abre el archivo kpi_analysis.sql.  
Reemplaza la fecha de referencia en la consulta por la fecha final deseada de tu análisis.  
Ejecuta la consulta para ver los resultados del CAC y el ROAS.

## Demostración del Agente (Mapeo de Lenguaje Natural a SQL) 🤖
"Compara el CAC y el ROAS de los últimos 30 días con respecto a los 30 días anteriores."  

Mapeo a la Consulta SQL: Esta pregunta se mapea directamente a la consulta ubicada en el archivo kpi_analysis.sql.  
El "Compara" se traduce al cálculo del delta (cambio porcentual).  
"CAC" y "ROAS" son las métricas calculadas a partir del spend y las conversions.  
"últimos 30 días" y "30 días anteriores" se traducen en los filtros de fecha (WHERE) dentro de las Expresiones de Tabla Comunes (CTEs).   

Resultado: Al ejecutar la consulta con el rango de fechas del proyecto, se obtiene la siguiente tabla que responde a la pregunta de negocio de manera precisa.  

![Tablas obtenidas apartir de la consulta a SQL](Images/Streamlit_View_Ex1.png)

## Contribuciones 🖨️
Si te interesa contribuir a este proyecto o usarlo independiente, considera:  
- Hacer un "fork" del repositorio.
- Crear una nueva rama (git checkout -b feature/nueva-caracteristica).
- Realizar tus cambios y "commitearlos" (git commit -am 'Agregar nueva característica').
- Subir tus cambios a la rama (git push origin feature/nueva-caracteristica).
- Abrir un "Pull Request".

## Licencia 📜
Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE (si aplica) para más detalles.


[English Version](README.en.md)
