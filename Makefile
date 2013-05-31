CC=arm-apple-darwin9-gcc
dylib=librespring.dylib
app=respring

libflags= -dynamiclib
appflags= -L./ -lrespring


all: $(dylib) $(app) SignBinary

$(app):
		$(CC) -multiply_defined suppress $(appflags) -o $(app) Application.mm
		
$(dylib):
		$(CC) -multiply_defined suppress $(libflags) -o $(dylib) Library.mm

SignBinary: 
		ldid -S $(app)
		ldid -S $(dylib)

clean:
		rm -f *.o $(app)
		rm -f *.o $(dylib)
