##
##
## Julia GUI 101
##

using Gtk


function hellogtkapp()
    
    # Layout Design
    win = GtkWindow("Hello Gtk!")

    vbox = GtkBox(:v)
    push!(win, vbox)

    label = GtkLabel("Hello, World!")
    GAccessor.justify(label, Gtk.GConstants.GtkJustification.CENTER)
    push!(vbox, label)

    button = GtkButton("Click Me!")
    push!(vbox, button)

    set_gtk_property!(vbox, :expand, label, true)

    # Set Button Instructions
    id = signal_connect(button, "button-press-event") do widget, event
        if get_gtk_property(vbox[1], :label, String) == "Hello, World!"
            GAccessor.text(label, "Hire Me!")
        else
            GAccessor.text(label, "Hello, World!")
        end
    end
    # Launch GUI w/ infinite loopS
    showall(win)

    while true
        println("(hit Enter to end session)")
        input = readline()
        if input == ""
            break
        end
    end
end