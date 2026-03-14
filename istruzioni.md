🌀 ISTRUZIONI: Generatore Mandelbrot Vulkan (Fedora)

Questo progetto esegue il calcolo del set di Mandelbrot sfruttando la potenza della GPU tramite le API Vulkan. La visualizzazione è gestita via OpenGL/GLFW.
📦 1. Installazione Dipendenze

Per preparare il tuo sistema Fedora, esegui il seguente comando nel terminale per installare i compilatori e i file di sviluppo necessari:
Bash

sudo dnf install gcc-c++ vulkan-loader-devel glfw-devel mesa-libGL-devel libX11-devel glslang

🛠️ 2. Compilazione ed Esecuzione

Il progetto utilizza uno script (compila.sh) che automatizza due fasi critiche:

    Compilazione dello Shader: Converte il codice sorgente della GPU (.comp) in bytecode binario (.spv).

    Compilazione del C++: Crea l'eseguibile finale collegando le librerie grafiche.

Per avviare il tutto:
Bash

chmod +x compila.sh
./compila.sh

Nota sulle ottimizzazioni (-O3)

Nel file compila.sh è attivo il flag -O3.

    Perché è qui: Forza il compilatore a vettorizzare i cicli e ad applicare ottimizzazioni aggressive, essenziali per mantenere fluido lo zoom nei frattali.

    Attenzione: Se riscontri crash improvvisi o comportamenti anomali, puoi modificare il file e scendere a -O2 (più stabile e conservativo).

🎮 3. Guida all'uso (Comandi)

Una volta aperta la finestra, puoi esplorare il set con questi tasti:
Tasto	Azione
W, A, S, D	Spostamento (Pan)
Q / E	Zoom Out / Zoom In
SHIFT (Maiusc)	Precision Mode: rallenta i movimenti per inquadrature millimetriche
P	Salva uno screenshot istantaneo (snapshot.ppm)
ESC	Esci dal programma

### Cambiare Palette Colori
Premi il tasto **C** per ciclare tra le diverse modalità di colorazione disponibili. La nuova modalità predefinita offre transizioni più fluide e variegate, mentre la modalità `paletteMode = 3` può offrire colori più "casuali" tramite hashing.
📂 4. Struttura dei File

    main.cpp: Logica dell'applicazione e gestione finestra.

    mandelbrot.comp: Il "cuore" del calcolo che gira sulla scheda video.

    compila.sh: Script di automazione per Fedora.

    *.ppm: File immagine generati (apribili con GIMP o visualizzatori standard)
