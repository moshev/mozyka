import plum
import time
plum.init()

plum.key.handler(plum.key.KEY_a, lambda state: print("Pressed A") if state == plum.key.PRESSED else print("Boo"))
plum.mouse.clickhandler(1, lambda x, y: print("LMB clicked at {0}, {1}.".format(x, y)))
class Dragger:
    def start(self, x, y):
        print("Starting drag at {0}, {1}".format(x, y))
    def drag(self, x, y, xrel, yrel):
        print("Now at ({0}, {1}), vector ({2}, {3})".format(x, y, xrel, yrel))
    def stop(self, x, y):
        print("Stopping drag at {0}, {1}".format(x, y))
plum.mouse.draghandler(1, Dragger())

plum.init_main_window(800, 600, "Press A", "")
plum.main_loop()

plum.quit()

