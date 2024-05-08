# Se importan las bibliotecas a utiliza
from collections import deque
import numpy as np
import cv2


# Se definene los rangos de la
# segmentación en el espacio de color HSV
blueLower = (90, 50, 50)
blueUpper = (110, 255, 255)

# Puntos para el seguimiento
pts = deque(maxlen=65)

# Si la computadora tiene mas de una cámara
# el argumento de VideoCapture cambia
# por defecto la primer camara es la "0"
video = cv2.VideoCapture(0)

while True:
        # Se obtiene una imagen del video
        ret, frame = video.read()
        # Si la imagen se pudo obtener se continua
        if frame is None:
                break
        blurred = cv2.GaussianBlur(frame, (15, 15), 5)
        hsv = cv2.cvtColor(blurred, cv2.COLOR_BGR2HSV)
        cv2.imshow('Filtarda', blurred)
        # Se contruye una máscara para la dereccion del color
        # y se realizan procesos de morfologia matematica
        mask = cv2.inRange(hsv, blueLower, blueUpper)
        mask = cv2.erode(mask, None, iterations=2)
        mask = cv2.dilate(mask, None, iterations=2)
        cv2.imshow('Segmentacion', mask)
        
        cnts, ret = cv2.findContours(mask.copy(), cv2.RETR_EXTERNAL,
                cv2.CHAIN_APPROX_SIMPLE)

        center = None
        # Si encuentra al menos un contorno se ejecuta
        if len(cnts) > 0:
                # Se encuentra la figura mas grande
                c = max(cnts, key=cv2.contourArea)
                ((x, y), radius) = cv2.minEnclosingCircle(c)
                M = cv2.moments(c)
                center = (int(M["m10"] / M["m00"]), int(M["m01"] / M["m00"]))
                # Si la figura es muy pequeña no se considera
                if radius > 100:
                        # Se dibuja un circulo de la región
                        cv2.circle(frame, (int(x), int(y)), int(radius),
                                (0, 255, 255), 2)
                        cv2.circle(frame, center, 5, (0, 0, 255), -1)
                # Se actualizan los puntos para graficar 
                pts.appendleft(center)

        # For para dibujar la trayectoria
        for i in range(1, len(pts)):
                # Si no hay puntos se ignora
                if pts[i - 1] is None or pts[i] is None:
                        continue
                # Se dibuja una linea
                cv2.line(frame, pts[i - 1], pts[i], (0, 0, 255), 2)
        # Se muestra el resultado
        cv2.imshow("Seguimiento", frame)
        key = cv2.waitKey(1) & 0xFF
        # Si se presiona "q" se sale del programa
        if key == ord("q"):
                break

video.release()
# Cierra todas las ventanas
cv2.destroyAllWindows()
