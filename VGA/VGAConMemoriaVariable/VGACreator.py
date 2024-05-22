import os

# Este codigo cre multiples archivos txt, uno por cada letra, estas letras son imagenes en blanco y negro que se convertiran a 1 y 0 
from PIL import Image #pip install pillow

Font = os.listdir("VGA\VGAConMemoriaVariable\Fuente")

for file in Font:
    if file.endswith('.png'):
        img = Image.open("VGA\VGAConMemoriaVariable\Fuente\\" + file).convert('1')
        pixels = list(img.getdata())
        binary_pixels = [0 if pixel == 255 else 1 for pixel in pixels]
        # Extrae el nombre del archivo sin la extensión
        filename = os.path.splitext(file)[0]

        # Abre un nuevo archivo de texto y escribe los píxeles binarios con saltos de línea
        with open(f'VGA\VGAConMemoriaVariable\{filename}.txt', 'w') as f:
            for i, pixel in enumerate(binary_pixels):
                if pixel == 0:
                    pixel = 1
                else:
                    pixel = 0
                f.write(str(pixel))
                if (i+1) % img.width == 0:
                    f.write('\n')