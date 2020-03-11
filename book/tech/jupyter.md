# Jupyter

Jupyter Notebooks are a powerful way to write and iterate on your Python code for data analysis. Rather than writing and re-writing an entire program, you can write lines of code and run them one at a time. Then, if you need to make a change, you can go back and make your edit and rerun the program again, all in the same window.

Click [here](https://www.cheatography.com/weidadeyue/cheat-sheets/jupyter-notebook/) for a cheatsheet on Jupyter key commands.

To add imports to notebooks, open the Anaconda GUI, go to the environments tab, click on the relevant environment, drop-down to uninstalled, search for the import and click apply.

NB. If using notebooks with conda, then make sure the jupyter package is installed via the environment.yml file.

## Commands

* To launch the app on a mac, go to the directory you want as the working directory: `/anaconda3/bin/jupyter_mac.command notebook`

* `shift` + `enter` : runs a cell of code

* `exit`/ `enter` : enter or exit edit mode

* `a`/`b` : add a new cell above or below

* `m` / 'y' : turn the cell into a markdown cell

* `dd` : deleted the highlighted cell

* `ii`: cancels the current cell from operating

## Code

* Starting a line with an exclamation mark will run the line as a terminal command.

* `%%capture` at the beginning of a cell will suppress the output.

## Magic Commands

* `%config IPCompleter.greedy=True` - enable autocompletion

* `%%time` - will return the length of time that the cell took to complete

* `` - 

## Visualisations

You can make cool anime visualisations with the following (which shows gradient descent):

```python
from matplotlib import animation, rc
import matplotlib_utils
from IPython.display import HTML, display_html

# nice figure settings
fig, ax = plt.subplots()
y_true_value = s.run(y_true)
level_x = np.arange(0, 2, 0.02)
level_y = np.arange(0, 3, 0.02)
X, Y = np.meshgrid(level_x, level_y)
Z = (X - y_true_value[0])**2 + (Y - y_true_value[1])**2
ax.set_xlim(-0.02, 2)
ax.set_ylim(-0.02, 3)
s.run(tf.global_variables_initializer())
ax.scatter(*s.run(y_true), c='red')
contour = ax.contour(X, Y, Z, 10)
ax.clabel(contour, inline=1, fontsize=10)
line, = ax.plot([], [], lw=2)

# start animation with empty trajectory
def init():
    line.set_data([], [])
    return (line,)

trajectory = [s.run(y_guess)]

# one animation step (make one GD step)
def animate(i):
    s.run(step)
    trajectory.append(s.run(y_guess))
    line.set_data(*zip(*trajectory))
    return (line,)

anim = animation.FuncAnimation(fig, animate, init_func=init,
                               frames=100, interval=20, blit=True)

try:
    display_html(HTML(anim.to_html5_video()))
except (RuntimeError, KeyError):
    # In case the build-in renderers are unaviable, fall back to
    # a custom one, that doesn't require external libraries
    anim.save(None, writer=matplotlib_utils.SimpleMovieWriter(0.001))
```


