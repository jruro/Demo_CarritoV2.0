El presente repositorio es simplemente una colección de modelos necesarios para la simulación de un carro con un brazo robótico que coloque separadores en una línea eléctrica.

----------------------------------------------------- NO HACER -----------------------------------------------------------------

Cada modelo consta de un model.rsdf, que viene a ser un modelo en sdf pero escrito en Embeded Ruby, un lenguaje que permite introducir variables y crear ficheros (en este caso sdf a patir de rsdf).
Para crear los sdf a partir de cada rsdf, habría que abrir una consola, y en la ruta del fichero que se quiere compilar, habria que introducir:

	erb model.rsdf > model.sdf

Con el objetivo de simplificar la tarea, se ha creado un script en el directorio raíz llamado erb_all.sh. Este script compila todos los model.rsdf y crea todos los model.sdf en sus respectivas carpetas.
Por lo tanto, para crear todos los model.sdf necesarios, simplemente habrá que ir en una terminal al directorio raíz y ejecutar: 

	./erb_all.sh

Es posible que esto de error en un principio porque el script se haya descargado como un fichero de texto y no como un archivo ejecutable. Para solucionar esto, en una terminal introducir:

	sudo chmod +x erb_all.sh

----------------------------------------------------- NO HACER -----------------------------------------------------------------

INSTRUCCIONES A PARTIR DE AQUÍ:

Estos modelos han de ser puestos en una carpeta en la que Gazebo sepa que ha de buscar para encontrar modelos, ya que si no no será posible introducirlos desde Gazebo. Para ello existen dos alternativas:

	- Añadir todas las carpetas con los modelos en el directorio ~/.gazebo/models/, que es un directorio que Gazebo ya conoce.
	- Poner todos los modelos en otra carpeta pero indicarle a Gazebo que ha de mirar en esa carpeta también para buscar modelos. Esto se consigue con el comando:

		export GAZEBO_MODEL_PATH=/ruta/a_mi/carpeta_de/modelos:$GAZEBO_MODEL_PATH
		(ejemplo: export export GAZEBO_MODEL_PATH=/home/disam/.gazebo/modelos_RE:$GAZEBO_MODEL_PATH)

	Este comando puede o bien introducirse en la terminal cada vez que se quiera abrir Gazebo, o bien añadirse al final del fichero ~/.bashrc

La segunda opción es la preferible.

A continuación se expone lo que representa cada uno de los modelos que hay en este repositorio:

	Aislador: Aislador cerámico que cuelga de la torre eléctrica y que sostiene el apoyo del cable.

	Apoyo_cables: Bifurcador que sale del aislador cerámico y que permite sostener dos cables a la torre.

	cable_torre: Modelo del cable diseñador directamente desde SolidEdge.

	Carrito: Modelo del carrito (vienen incluidos otros modelos).

	Grapa: Modelo de la grapa que se va a colocar en los cables.

	grass_plane: Plano de hierba. No requiere un model.rsdf, ya que no tiene parámetros.

	Herramienta: Modelo de la herramienta que se encarga de colocar la grapa y de atornillarla.

	Red_electrica: Modelo de un par de torres con sus respectivos aisladores y bifurcadores, sosteniendo todos los cables posibles con sus aisladores.

	Rueda: Modelo de la rueda del carrito.

	Torre: Modelo de la torre eléctrica.

	Tren: modelo completo de cada uno de los trenes que compone el carrito.

	ur3: modelo del brazo robótico UR3. No requiere un model.rsdf, ya que no tiene parámetros.

Como se deduce de lo anterior, algunos modelos no están hechos para ultilizarlos por separado, sino que forman parte de otros. Realmente, los únicos modelos que se usan por separado son el tren, la red eléctrica, la grapa y el plano de césped.

Cada uno de los ficheros erb tiene una serie de parámetros modificables, que se explican en detalle en cada uno de ellos.

Por tanto, para ejecutar todo el sistema, se ha escogido el siguiente método:

- Abrir terminal y poner roscore
- Abrir otro terminal y poner rosrun gazebo_ros gazebo
- Darle a la pestaña Insertar de arriba a la derecha en el panel de gazebo, y buscar en los modelos el model Red Eléctrica
- Añadir en el lugar que se quiera del mapa las dos torres con los cables
- Añadir el modelo Tren, y ajustarlo con los parámaetros de traslación a los cables (se recomienda pausar el mundo para un mejor ajuste del modelo)

Próximamente se tendrá un único paquete que ejecutará todos los modelos, y así con una única sentencia de roslaunch será suficiente ver el sistema completo
