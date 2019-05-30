# La huerta de Toni - Game

## Etapa 1 - Modelo básico

### Intro
Toni es un [amigo youtuber](https://www.youtube.com/channel/UC8nVWi8L7fPCjOMpSSNAM0Q) que se gana la vida cultivando plantas de distintas especies.
Para ello tiene que sembrar, regar y cosechar sus cultivos. Después de la cosecha, Toni vende lo que cultivó, obteniendo ganancias en la forma de monedas de oro.
Toni es muy ahorrativo y todo el oro que obtiene por sus cosechas lo acumula.

Nuestro objetivo es construir un juego en el que podamos controlar a Toni, utilizando el teclado para moverlo alrededor del tablero. Pero en esta primera parte vamos a concentrarnos solamente en programar las clases y objetos necesarios para modelar su comportamiento; agregaremos las cosas de _game_ en una segunda etapa.

En este juego consideramos tres especies: _maíz_, _trigo_ y _tomaco_.

### Sembrar
El acto de sembrar crea una nueva planta, con estas características:  

| Planta | Situación al ser sembrada |
|---|---|
| **Maíz**   | Es una planta bebé. |
| **Trigo**  | Está en etapa de evolución 0. |
| **Tomaco** | Es una planta hecha y derecha. |

Cada vez que se siembra una planta, Toni la agrega a una colección de `plantasSembradas`.

### Regar
Una vez sembrado un cultivo, para que crezca debe ser regado.

Agregar a Toni un método `regarLasPlantas()` que riegue cada una de las plantas que hay sembradas.
Cada planta reacciona diferente cuando es regada:

| Planta | Efecto al ser regada |
|---|---|
| **Maíz**   | Si es bebé, pasa a adulta. Si ya es adulta, no pasa nada. |
| **Trigo**  | Pasa a la etapa de evolución siguiente: de 0 a 1, de 1 a 2, de 2 a 3, de 3 vuelve a 0. |
| **Tomaco** | Ninguno. |

### Cosechar
Una planta, puede o no estar lista para la cosecha. El _maíz_ está listo para la cosecha si es adulto, el _trigo_ si está en nivel de evolución 2 o más, el _tomaco_ siempre.

Si la planta está lista para la cosecha, se la cosecha, para luego poder venderla. Toni debe recordar qué plantas tiene para vender. El acto de cosechar una planta implica que ya no está sembrada (y por lo tanto debe reflejarse en la colección).

Agregar a Toni los siguientes métodos:
* `plantasListasParaCosechar()`: el conjunto de las plantas sembradas que ya se pueden cosechar;
* `cosecharTodo()`: que cosecha _solamente_ las plantas que sembró y que ya están listas. Conviene acá hacer un método que resuelva la cosecha para una planta y luego utilizarlo para desarrollar `cosecharTodo()`;

### Venta
Implementar un método `venderCosecha()` que vende todas las plantas que ya fueron previamente cosechadas. Al hacerlo, obtiene el oro por cada planta que tiene, de acuerdo a esta especificación:
- **Maíz**: 150 monedas por planta.
- **Trigo**: 100 monedas si está en etapa 2, 200 si está en etapa 3.
- **Tomaco**: 80 monedas por planta.

Toni debe acumular el oro y recordar cuánto oro obtuvo en total. De nuevo, la recomendación es hacer primero un método que venda **una** planta y luego hacer el que vende todas.

**Atenti**  
Una vez que vende lo que tiene para vender, obviamente, deja de tenerlo.

## Etapa 2 - consultas

A partir de lo implementado en la etapa anterior, queremos agregar las siguientes consultas a Toni:

* `paraCuantosDiasLeAlcanza():` asumiendo que tiene un gasto de 200 monedas por día, indica para cuántos días le alcanza el dinero. Considerar para esta cuenta el dinero acumulado **más** lo que podría sacar si vende su cosecha actual;
* `cuantoHayParaCeliacos():` indica cuántas plantas de las sembradas podrían ser consumidas por personas con celiaquía, las cuales solo pueden comer alimentos sin gluten (el trigo tiene gluten, el tomaco y el maíz no). Considerar solamente las plantas que estén listas para cosechar;
* `convieneRegar():` indica si alguna de las plantas sembradas aún no está lista para la cosecha - porque en ese caso convendría regar para acelerar el proceso.

## Etapa 3 - la Pachamama

Agregar al modelo un objeto que represente a la Pachamama, el cual (obviamente) provocará distintos cambios sobre nuestros cultivos.

En una sobresimplificación, vamos a decir que la Pacha tiene un nivel de agradecimiento, que arranca en 10 y que se puede modificar según las siguientes conductas del ser humano y la naturaleza:

* `llover()`: aumenta en 5 el nivel de agradecimiento;
* `tirarBasura()`: disminuye en 10 el nivel de agradecimiento;
* `fumigar()`: lleva el nivel de agradecimiento a 0, sin importar en cuánto estaba;
* `abonar()`: duplica el nivel de agradecimiento - si estaba en 5 queda en 10, si estaba en 2 queda en 4, etc.

Agregarle también un método `estaAgradecida()` que nos indica si su nivel de agradecimiento es de 10 o más.

Cuando está agradecida, cada planta reacciona de distinta manera:
* el _maíz_ crece más alto, y su valor en el mercado es de 180 por planta;
* el _trigo_ crece más rápido, por lo tanto su nivel aumenta en 2 cada vez que se lo riega;
* el _tomaco_ se pudre porque es un injerto artificial y por lo tanto ya no estará listo para la cosecha.

Cuando no está agradecida, las plantas mantienen el comportamiento de la etapa 1.

Hacer las modificaciones que hagan falta en las plantas para que se comporten de esa manera. Tener en cuenta que habrá un solo objeto que represente a la `pachamama`, y que el código de las plantas deberá modificarse automáticamente según su estado de agradecimiento.
