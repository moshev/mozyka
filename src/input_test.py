import plum
import geometry
import time

class Dragger:
    def start(self, x, y):
        print("Starting drag at {0}, {1}".format(x, y))
    def drag(self, x, y, xrel, yrel):
        print("Now at ({0}, {1}), vector ({2}, {3})".format(x, y, xrel, yrel))
    def stop(self, x, y):
        print("Stopping drag at {0}, {1}".format(x, y))

plum.init()
w = plum.init_screen(800, 600, "Press A", "")

w.key.add_handler(plum.keycode['a'], lambda state: print("Pressed A") if state == plum.keystate.PRESSED else print("Released A"))
w.mouse.add_clickhandler(1, lambda x, y: print("LMB clicked at {0}, {1}.".format(x, y)))
w.mouse.add_draghandler(1, Dragger())

w.main_loop()

plum.quit()

