################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

module CZMQ
  module FFI

    # work with directory patches
    # @note This class is 100% generated using zproject.
    class ZdirPatch
      # Creates a new file
      CREATE = 1

      # Delete a file
      DELETE = 2

      # Raised when one tries to use an instance of {ZdirPatch} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zdir_patch_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create new patch
      # @param path [String, #to_s, nil]
      # @param file [Zfile, #__ptr]
      # @param op [Integer, #to_int, #to_i]
      # @param alias_ [String, #to_s, nil]
      # @return [CZMQ::ZdirPatch]
      def self.new(path, file, op, alias_)
        file = file.__ptr if file
        op = Integer(op)
        ptr = ::CZMQ::FFI.zdir_patch_new(path, file, op, alias_)
        __new ptr
      end

      # Destroy a patch
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zdir_patch_destroy(self_p)
        result
      end

      # Create copy of a patch. If the patch is null, or memory was exhausted,
      # returns null.                                                         
      #
      # @return [ZdirPatch]
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_dup(self_p)
        result = ZdirPatch.__new result, true
        result
      end

      # Return patch file directory path
      #
      # @return [String]
      def path()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_path(self_p)
        result
      end

      # Return patch file item
      #
      # @return [Zfile]
      def file()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_file(self_p)
        result = Zfile.__new result, false
        result
      end

      # Return operation
      #
      # @return [Integer]
      def op()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_op(self_p)
        result
      end

      # Return patch virtual file path
      #
      # @return [String]
      def vpath()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_vpath(self_p)
        result
      end

      # Calculate hash digest for file (create only)
      #
      # @return [void]
      def digest_set()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_digest_set(self_p)
        result
      end

      # Return hash digest for patch file
      #
      # @return [String]
      def digest()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zdir_patch_digest(self_p)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zdir_patch_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
