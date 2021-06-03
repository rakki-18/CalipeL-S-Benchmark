accessing - monticello
monticelloSmalltalkXProjectType
    "Returns either #library or #application.
     This information is used by Smalltalk/X when reading back Monticello package
     to patch my superclass as neither LibraryDefinition nor ApplicationDefinition classes
     are present in Squeak/Pharo images."

    ^#library
