## #. Revisión de Literatura

### #.1. Potencial de ChatGPT en el Desarrollo de Software

- Abu Jaber, Beganovic y Abd Almisreb (2023):

Los autores elaboran una revisión de literatura sobre el potencial de ChatGPT en el desarrollo de software. Exponen los potenciales de uso para reparación y solución de averías y educación para este fin; optimización de programas y algoritmos numéricos, incluyendo la inclusión de ChatGPT como controlador integrado en una Inteligencia Generalizada; creación de soluciones y arquitecturas de software, tanto de manera comparativa (evaluación de varias respuestas) como en un proceso dialógico con la aplicación para el diseño arquitectónico de software; y consideraciones para el Prompt Engineering al utilizar el programa para el desarrollo de software.

- Rahmaniar (2023);

Expone la posibilidad de ganancias en términos de productividad en el campo de el desarrollo de software, por medio de la asistencia en la programación, creación de documentación, entrenamiento de nuevos programadores, revisión de código, e interacciones con clientes e interesados. Esto por medio del entendimiento del modelo en términos de lenguaje natural, capacidad generativa, capacidad y flexibilidad en aprendizaje del modelo, interactividad (dialógica), gran diversidad de aplicación para su utilización, y contribución en el espacio del Open Source. Sin embargo, es necesario tomar en cuenta las ramificaciones negativas, como posible incompletitud del código generado, lo cual puede causar dificultades a los usuarios y posibles vulnerabilidades de seguridad; en este último punto, también puede existir utilización maliciosa del modelo para crear malware. Igualmente, se debe tener en cuenta las consideraciones éticas, especialmente pues en el proceso de aprendizaje, los modelos pueden integrar y perpetuar sesgos con consecuencias negativas. Con las mejoras futuras en los modelos de lenguaje, especialmente con el potencial de los modelo GPT, la generación de respuestas tendría mejor rendimiento, lo cual se traduciría en mayor facilidad y productividad al utilizar las herramientas de LLM por parte de desarrolladores de software. Futuras versiones podrían ver una dinamización en el proceso de desarrollo, en el cual la generación es constante con la finalidad de optimizar y reparar código en tiempo real.

### #.2 ChatGPT puesto a prueba:

- Ahmad, Waseem, Liang, Fehmideh, Aktar & Mikkonen (2023):

Este artículo describe el proceso de creación de arquitectura de software por medio de la colaboración humano-bot. Empezando de una descripción general en lenguaje natural de las condiciones que debe satisfacer la arquitectura de un producto de software, fue posible para un arquitecto neófito diseñar el "blueprint" del software requerido.

- Sobania, Hanna, Briesch & Petke (2023):

Los autores utilizan problemas de código defectuoso proveniente de QuickBugs para poner a prueba la capacidad de reparación de código de ChatGPT. Compararon los resultados de ChatGPT con los obtenidos a través de dos LLMs y una RN especializados en problemas de programación. ChatGPT logró un rendimiento similar a los demás LLMs y mucho mejor que el de la RN. La aplicación logró resolver cerca del 50% de problemas tras la consulta inicial, y cerca del 78% tras entrar en diálogo con el chatbot para proveer mayor información y aclaraciones. Sin embargo, Zhang et al. (2023) mencionan que la base de datos QuickBugs podría haber sido utilizada en el entrenamiento del modelo de lenguaje, por lo cual los resultados obtenidos pueden apuntar al ajuste del modelo a la muestra de entrenamiento y podrían no ser generalizables.

- Zhang, Zhang, Zhai, Fang, Yu, Sun & Chen (2023):

Los autores ponen a prueba a ChatGPT para la reparación de código defectuoso. Para esto, generaron una base de datos de problemas de programación en AtCode, de manera que cada problema tuviera una respuesta correcta y una incorrecta. La respuesta correcta fue utilizada como consulta al chatbot, y se le pidió que repare el código. Con un prompt básico, ChatGPT logró reparar correctamente 109 de 151 programas averiados. En total, con este y otros prompts, se logró reparar 143 programas averiados

### #.3 Impacto de ChatGPT en Desarrollo de Software

- Gallea (2023):

El autor compara las páginas de Stack Overflow para Python y R, al ser ambos lenguajes de programación utilizados para ciencia de datos. Con datos de Stack Overflow Explorer, específicamente datos sobre número de preguntas, estatus de resolución de las preguntas, y puntaje de cada una. Los resultados por medio de las Diferencias en Diferencias implican un impacto negativo en la cantidad de preguntas, positivo en el puntaje promedio (como medida de calidad) de las preguntas, y negativo en la proporción de preguntas resueltas (como medida de complejidad), en Python en comparación con R.

- Saguu & Ante (2023):

Los autores analizan los retornos de cripto-activos relacionados a la inteligencia artificial. Para esto, utilizan data de frecuencia diaria de los precios de cripto-activos en coingecko y coinmarketcap. El grupo de tratamiento es considerado como aquellos activos relacionados a la inteligencia artificial, y el tiempo de aplicación del tratamiento es el lanzmiento de ChatGPT. Controlan también por la capitalización total y el volumen de transacciones para cada activo. Utilizan tanto el método de Diferencias en Diferencias y Diferencias en Diferencias Sintéticas. Hallan que el lanzamiento de ChatGPT tuvo un impacto positivo en el retorno de aquellos actuvos relacionados a la inteligencia artificial en ambas plataformas.

- Demirci, Hannane & Xinrong (2023):

Los autores analizan el impacto de ChatGPT en la demanda de servicios de trabajadores independientes en una plataforma que conecta oferta y demanda de estos servicios. Primero, identifican grupos de servicios según las habilidades necesarias para llevarlos a cabo. Luego, asignan un índice de exposición a la inteligencia artificial a cada tipo de servicio, el cual indica qué tan factible es utilizar la IA para llevar a cabo los servicios en cada grupo. También ajustan el análisis por medio del Índice de Volumen de Búsquedas de Google. Aplican el método de Diferencias en Diferencias entre dos grupos: alta y baja exposición a la inteligencia artificial. Hallan que el impacto de ChatGPT fue negativo en la cantidad de publicaciones que buscan servicios en los grupos con alta exposición al la IA, en comparación con aquellos con bajo índice de exposición.

- Del Rio-Chanona, Laurentsyeva & Wachs (2023):

Este es otro ejemplo de análisis del impacto de ChatGPT en las plataformas de preguntas y respuestas para temas de programación. En este caso, los autores compara Stack Overflow con Math Exchange, una plataforma centrada en preguntas y respuestas sobre matemáticas; los temas de esta plataforma serían menos susceptibles a los efectos de ChatGPT. También comparan Stack Overflow con su contraparte rusa y con Segmentdefault, su contraparte china; el acceso a ChatGPT es restringido en estos dos países. Al aplicar Diferencias en Diferencias, los autores encuentran un impacto negativo en el número de posts por semana, número de preguntas por semana, y el número de posts en días de semana, en Stack Overflow en comparación con las demás plataformas.

- Kreitmeir & Raschky (2023):

Finalmente, los autores analizan el impacto en la productividad en el desarrollo de software por medio de datos de frecuencia diaria al nivel de usuario provistos por GitHub. Explotan la prohibición de ChatGPT en Italia, país al cual comparan con Francia y Austria. Como medidas de productividad, los autores utilizan la existencia de nuevos lanzamientos por parte de cada usuario; la suma de push, pull-requests, comentarios en pull-requests, comentarios en commit, create e issues; suma de pushes y pulls; número de eventos totales por usuario. También analizan la cantidad de de Tor nuevos, pues por este medio los usuarios en países donde el acceso es restringido pueden eludir la prohibición, lo cual indicaría una alta demanda y reconocimiento de la utilidad de la aplicación. El resultado obtenido por medio del método de Diferencias en Diferencias indica un impacto negativo significativo en la probabilidad de que cada usuario-día presente un nuevo lanzamiento de software, en Italia en comparación con otros países; esto indica una menor capacidad productiva como resultado de la prohibición.