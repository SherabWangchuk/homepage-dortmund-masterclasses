Anleitung zur Software-Installation für die LHCb-Masterclass
---

## Linux und Mac OS X ##
Linux oder OS X Benutzer können die Software für die Masterclasses mit den folgenden Anweisungen herunterladen und installieren: 

Zunächst wird eine aktuelle Version (5.34/24) der Software ROOT benötigt. Diese kann [hier](http://root.cern.ch/drupal/content/downloading-root) heruntergeladen werden. Wenn Sie ROOT selbst kompilieren wollen, ist es notwendig Version 5 zu verwenden und die Erzeugung zusätzlicher Libraries anzuschalten in dem Sie folgenden Befehl zur Konfiguration verwenden:

`./configure --enable-table --enable-opengl`

Anschließend müssen noch folgende Anweisungen befolgt werden um die Installation abzuschließen:

Für Linux folgen Sie bitte [diesen](http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/en/Selection.txt) Anweisungen.  
Für OS X folgen Sie bitte [diesen](http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/en/SelectionOSX.txt) Anweisungen.



## Windows ##

Für Windows kann die Software [hier](http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/LHCbMasterclassROOT.2.0.4.zip) heruntergeladen werden. Es ist ein ZIP-Archiv, das die benötigte Software und die Masterclass-Aufgaben enthält. Nach dem Entpacken kann das Programm mit der Datei **start.bat** gestartet werden.


## ROOT-Skript zum Zusammenfügen der Histogramme ##

Das Skript kann [hier](http://lhcb-public.web.cern.ch/lhcb-public/en/LHCb-outreach/masterclasses/en/CopiaHisto2.C) heruntergeladen werden.
Es sollte in folgender Prozedur verwendet werden:  
1) Sammeln Sie alle während der Übungen erzeugten Histogramme im selben Verzeichnis.  
2) Starten Sie das ROOT-Skript um die Histogramme zu "inkrementellen" gif-Files zu verarbeiten.  
3) Während der Präsentation der Ergebnisse können die Histogramme dann mit dem Befehl `animate
-delay XX...` in einer Sequenz angezeigt werden. 