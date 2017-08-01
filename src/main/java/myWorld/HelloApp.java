package myWorld;

// **********************************************************************
import myWorld.MyStorage;
import myWorld.MyLogger;

// **********************************************************************
public class HelloApp
{
   // **********************************************************************
   // public
   // **********************************************************************
   // ******** methods

   // **********************************************************************
   public HelloApp()
   {
      String methodName = "HelloApp";
      MyLogger.Instance.entering(getClass().getName(), methodName);

      MyPrintCount = 1;
      MyTraces = null;
      MyTracesName = "myHelloApp.traces";
      ShouldPrintOnStdout = true;
      MyStorage.deleteFile(MyTracesName);

      MyLogger.Instance.info("MyPrintCount = " + Integer.toString(MyPrintCount)
         + " - MyTracesName = " + MyTracesName);

      MyLogger.Instance.exiting(getClass().getName(), methodName);
   }

   // **********************************************************************
   public HelloApp(int printCount)
   {
      String methodName = "HelloApp_int";
      MyLogger.Instance.entering(getClass().getName(), methodName);

      MyPrintCount = printCount;
      MyTraces = null;
      MyTracesName = "myHelloApp.traces";
      ShouldPrintOnStdout = true;
      MyStorage.deleteFile(MyTracesName);

      MyLogger.Instance.info("MyPrintCount = " + Integer.toString(MyPrintCount)
         + " - MyTracesName = " + MyTracesName);

      MyLogger.Instance.exiting(getClass().getName(), methodName);
   }

   // **********************************************************************
   public HelloApp(String tracesName)
   {
      String methodName = "HelloApp_String";
      MyLogger.Instance.entering(getClass().getName(), methodName);

      MyPrintCount = 1;
      MyTraces = null;
      MyTracesName = tracesName;
      ShouldPrintOnStdout = true;
      MyStorage.deleteFile(MyTracesName);

      MyLogger.Instance.info("MyPrintCount = " + Integer.toString(MyPrintCount)
         + " - MyTracesName = " + MyTracesName);

      MyLogger.Instance.exiting(getClass().getName(), methodName);
   }

   // **********************************************************************
   public HelloApp(int printCount, String tracesName)
   {
      String methodName = "HelloApp_int_String";
      MyLogger.Instance.entering(getClass().getName(), methodName);

      MyPrintCount = printCount;
      MyTraces = null;
      MyTracesName = tracesName;
      ShouldPrintOnStdout = true;
      MyStorage.deleteFile(MyTracesName);

      MyLogger.Instance.info("MyPrintCount = " + Integer.toString(MyPrintCount)
         + " - MyTracesName = " + MyTracesName);

      MyLogger.Instance.exiting(getClass().getName(), methodName);
   }

   // **********************************************************************
   public void run()
   {
      String methodName = "run";
      MyLogger.Instance.entering(getClass().getName(), methodName);

      String indent = "-";
      String countString = Integer.toString(MyPrintCount);

      if (MyTracesName.length() > 0)
      {
         MyTraces = new MyStorage(MyTracesName);
      }
      else
      {
         MyTraces = new MyStorage();
      }

      MyTraces.addData(countString);

      for (int i = 1; i < MyPrintCount; i++)
      {
         indent = indent + "-";
      }
      MyLogger.Instance.fine("indent = '" + indent + "'");
      myPrint(indent);
      myPrint(indent + " Hello World !");
      myPrint(indent);

      MyTraces.saveData();

      MyLogger.Instance.exiting(getClass().getName(), methodName);
   }

   // **********************************************************************
   // ******** attributes

   // **********************************************************************
   public int getMyPrintCount()
   {
      return(MyPrintCount);
   }

   // **********************************************************************
   public String getMyTracesName()
   {
      return(MyTracesName);
   }

   // **********************************************************************
   public boolean getShouldPrintOnStdout()
   {
      return(ShouldPrintOnStdout);
   }

   // **********
   public void setShouldPrintOnStdout(boolean value)
   {
      ShouldPrintOnStdout = value;
   }

   // **********************************************************************
   // ******** associations

   // **********************************************************************
   public int cardMyTraces()
   {
      int theCard = 0;

      if (MyTraces != null)
      {
         theCard = 1;
      }

      return(theCard);
   }

   // **********
   public MyStorage getMyTraces()
   {
      return(MyTraces);
   }

   // **********************************************************************
   // protected
   // **********************************************************************
   // ******** methods

   // **********************************************************************
   protected void myPrint(String message)
   {
      if (getShouldPrintOnStdout())
      {
         System.out.println(message);
      }
      MyTraces.addData(message);
   }

   // **********************************************************************
   // private
   // **********************************************************************
   // ******** attributes
   private int MyPrintCount;
   private String MyTracesName;
   private MyStorage MyTraces;
   private boolean ShouldPrintOnStdout;
}
