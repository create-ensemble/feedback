# First copy all the jars from Processing to Max (see README.md).
# Then adjust this classpath according to which version of Max
# you have.
#

# for Max 6.1.10
#
CLASSPATH = -cp ".:/Applications/Max 6.1/Cycling '74/java/lib/*"

# for Max 5
#
#CLASSPATH = -cp ".:/Applications/Max5/Cycling '74/java/lib/*"

# You have to use JDK version 1.6. For me, it's here:
#
JAVAC = /System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/bin/javac

# you might not need the line above, like i do. you may do this:
#
#JAVAC = javac

shell:
	$(JAVAC) $(CLASSPATH) shell.java

clean:
	rm *.class
