/*
 * Copyright (c) 2007, 2011, Oracle and/or its affiliates. All rights reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Oracle designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Oracle in the LICENSE file that accompanied this code.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Oracle, 500 Oracle Parkway, Redwood Shores, CA 94065 USA
 * or visit www.oracle.com if you need additional information or have any
 * questions.
 */

package com.taobao.csp.btrace.core.script.test;

import com.taobao.csp.objectweb.asm.AnnotationVisitor;
import com.taobao.csp.objectweb.asm.Attribute;
import com.taobao.csp.objectweb.asm.ClassVisitor;
import com.taobao.csp.objectweb.asm.FieldVisitor;
import com.taobao.csp.objectweb.asm.Label;
import com.taobao.csp.objectweb.asm.MethodHandle;
import com.taobao.csp.objectweb.asm.MethodVisitor;


/**
 * A visitor that does nothing on visitXXX calls.
 * Implements all visitor interfaces of ASM library.
 *
 * @author A. Sundararajan
 */
public class NullVisitor implements AnnotationVisitor,
        ClassVisitor, FieldVisitor, MethodVisitor {

    // AnnotationVisitor methods
    public void visit(String name, Object value) {
    }

    public AnnotationVisitor visitAnnotation(String name, String desc) {
        return this;
    }

    public AnnotationVisitor visitArray(String name) {
        return this;
    }

    public void visitEnd() {
    }
     
    public void visitEnum(String name, String desc, String value) {
    }

    // ClassVisitor methods
    public void visit(int version, int access, String name, 
            String signature, String superName, String[] interfaces) {
    }
     
    public AnnotationVisitor visitAnnotation(String desc, boolean visible) {
        return this;
    }    

    public void visitAttribute(Attribute attr) {
    }
   
    // already implemented
    // public void visitEnd()    

    public FieldVisitor visitField(int access, String name, String desc, 
            String signature, Object value) {
        return this;
    }
     
    public void visitInnerClass(String name, String outerName,
           String innerName, int access) {
    }

    public MethodVisitor visitMethod(int access, String name, String desc, 
           String signature, String[] exceptions) {
        return this;
    }

    public void visitOuterClass(String owner, String name, String desc) {
    }

    public void visitSource(String source, String debug) {
    }

    // FieldVisitor methods

    // already implemented
    // public AnnotationVisitor visitAnnotation(String desc, boolean visible)

    // already implemented
    // public void visitAttribute(Attribute attr)

    // already implemented
    // public void visitEnd() 

    // MethodVisitor methods

    // already implemented
    // public AnnotationVisitor visitAnnotation(String desc, boolean visible)

    public AnnotationVisitor visitAnnotationDefault() {
        return this;
    }
     
    // already implemented
    // public void visitAttribute(Attribute attr)
 
    public void visitCode() {
    }
     
    // already implemented
    // public void visitEnd()

    public void visitFieldInsn(int opcode, String owner, 
            String name, String desc) {
    }

    public void visitFrame(int type, int nLocal, Object[] local, 
            int nStack, Object[] stack) {
    }

    public void visitIincInsn(int var, int increment) {
    }

    public void visitInsn(int opcode) {
    }
 
    public void visitIntInsn(int opcode, int operand) {
    }

    public void visitJumpInsn(int opcode, Label label) {
    }

    public void visitLabel(Label label) {
    }

    public void visitLdcInsn(Object cst) {
    }

    public void visitLineNumber(int line, Label start) {
    }

    public void visitLocalVariable(String name, String desc, 
            String signature, Label start, Label end, int index) {
    }

    public void visitLookupSwitchInsn(Label dflt, 
            int[] keys, Label[] labels) {
    }

    public void visitMaxs(int maxStack, int maxLocals) {
    }

    public void visitMethodInsn(int opcode, String owner, 
            String name, String desc) {
    }

    public void visitMultiANewArrayInsn(String desc, int dims) {
    }

    public AnnotationVisitor visitParameterAnnotation(int parameter, 
            String desc, boolean visible) {
        return this;
    }

    public void visitTableSwitchInsn(int min, int max, 
            Label dflt, Label[] labels) {
    }
     
    public void visitTryCatchBlock(Label start, Label end,
            Label handler, String type) {
    }

    public void visitTypeInsn(int opcode, String desc) {
    }

    public void visitVarInsn(int opcode, int var) {
    }

	@Override
	public void visitInvokeDynamicInsn(String name, String desc, MethodHandle bsm, Object... bsmArgs) {
		// TODO Auto-generated method stub
		
	}   
}
