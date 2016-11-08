#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux
CND_DLIB_EXT=so
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/f5301fce/Interaccao.o \
	${OBJECTDIR}/_ext/f5301fce/Ponto.o \
	${OBJECTDIR}/_ext/f5301fce/Principal.o \
	${OBJECTDIR}/_ext/f5301fce/Rectangulo.o \
	${OBJECTDIR}/Desenho.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/ex4

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/ex4: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/ex4 ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/_ext/f5301fce/Interaccao.o: ../../../../../Downloads/ex4/Interaccao.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/f5301fce
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f5301fce/Interaccao.o ../../../../../Downloads/ex4/Interaccao.cpp

${OBJECTDIR}/_ext/f5301fce/Ponto.o: ../../../../../Downloads/ex4/Ponto.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/f5301fce
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f5301fce/Ponto.o ../../../../../Downloads/ex4/Ponto.cpp

${OBJECTDIR}/_ext/f5301fce/Principal.o: ../../../../../Downloads/ex4/Principal.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/f5301fce
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f5301fce/Principal.o ../../../../../Downloads/ex4/Principal.cpp

${OBJECTDIR}/_ext/f5301fce/Rectangulo.o: ../../../../../Downloads/ex4/Rectangulo.cpp 
	${MKDIR} -p ${OBJECTDIR}/_ext/f5301fce
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/_ext/f5301fce/Rectangulo.o ../../../../../Downloads/ex4/Rectangulo.cpp

${OBJECTDIR}/Desenho.o: Desenho.cpp 
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.cc) -g -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/Desenho.o Desenho.cpp

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}
	${RM} ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/ex4

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
