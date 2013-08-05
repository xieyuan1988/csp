package com.taobao.csp.objectweb.asm.commons;

import java.util.Collections;
import java.util.Comparator;

import com.taobao.csp.objectweb.asm.MethodVisitor;
import com.taobao.csp.objectweb.asm.tree.MethodNode;
import com.taobao.csp.objectweb.asm.tree.TryCatchBlockNode;

/**
 * Sorts the exception handlers in a method innermost-to-outermost. This allows
 * the programmer to add handlers without worrying about ordering them correctly
 * with respect to existing, in-code handlers.
 * 
 * Behavior is only defined for properly-nested handlers. If any "try" blocks
 * overlap (something that isn't possible in Java code) then this may not do
 * what you want. In fact, this adapter just sorts by the length of the "try"
 * block, taking advantage of the fact that a given try block must be larger
 * than any block it contains).
 * 
 * @author Adrian Sampson
 */
public class TryCatchBlockSorter extends MethodNode {

    private final MethodVisitor mv;

    public TryCatchBlockSorter(
        final MethodVisitor mv,
        final int access,
        final String name,
        final String desc,
        final String signature,
        final String[] exceptions)
    {
        super(access, name, desc, signature, exceptions);
        this.mv = mv;
    }

    public void visitEnd() {
        // Compares TryCatchBlockNodes by the length of their "try" block.
        Comparator<TryCatchBlockNode> comp = new Comparator<TryCatchBlockNode>() {

            public int compare(TryCatchBlockNode t1, TryCatchBlockNode t2) {
                int len1 = blockLength(t1);
                int len2 = blockLength(t2);
                return len1 - len2;
            }

            private int blockLength(TryCatchBlockNode block) {
                int startidx = instructions.indexOf(block.start);
                int endidx = instructions.indexOf(block.end);
                return endidx - startidx;
            }
        };
        Collections.sort(tryCatchBlocks, comp);
        if (mv != null) {
            accept(mv);
        }
    }
}
