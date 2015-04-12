import com.cycling74.max.*;

public class shell extends MaxObject {

  private static final String[] INLET_ASSIST = new String[] {
    "Send me a shell command as a message(i.e. touch /tmp/foo)."
  };
  private static final String[] OUTLET_ASSIST = new String[] {
    "Expect a bang from here when the command is done."
  };

  public shell(Atom[] args) {
    declareInlets(new int[]{DataTypes.ALL});
    declareOutlets(new int[]{DataTypes.ALL});
    setInletAssist(INLET_ASSIST);
    setOutletAssist(OUTLET_ASSIST);
    createInfoOutlet(false);
  }

  public void anything(String command, Atom[] argument) {
    for (Atom a : argument)
      command += " " + a;
    try {
      Process p = Runtime.getRuntime().exec(command);
      p.waitFor();
      outletBang(0);
    }
    catch (Exception e){
      post("Exception is:" + e);
    }
  }
}
