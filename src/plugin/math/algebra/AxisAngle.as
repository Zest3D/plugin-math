/**
 * Plugin.IO - http://www.plugin.io
 * Copyright (c) 2011-2012
 *
 * Geometric Tools, LLC
 * Copyright (c) 1998-2012
 * 
 * Distributed under the Boost Software License, Version 1.0.
 * http://www.boost.org/LICENSE_1_0.txt
 */
package plugin.math.algebra {
	import plugin.core.interfaces.ICloneable;
	import plugin.core.interfaces.IDisposable;
	import plugin.core.interfaces.IEquatable;
	import plugin.core.interfaces.IResetable;
	
	/**
	 * A representation of an axis and angle.
	 * 
	 * @author Gary Paluk
	 */
	public class AxisAngle implements IDisposable, IEquatable, ICloneable, IResetable
	{
		/**
		 * An <code>AVector</code> defining the axis.
		 */
		public var axis: AVector;
		
		/**
		 * A <code>Number</code> that defining the angle.
		 */
		public var angle: Number;
		
		/**
		 * Disposed flag set to <code>true</code> once the object has been <code>disposed.</code>
		 */
		protected var _isDisposed: Boolean;
		
		/**
		 * Representation of an axis with an angle. If no angle is defined, a default of 0 is used.
		 * 
		 * @param	axis	An <code>AVector</code> defining the axis
		 * @param	angle	A <code>Number</code> that defining the angle in radians.
		 */
		public function AxisAngle( axis: AVector, angle: Number = 0 )
		{
			this.axis = axis;
			this.angle = angle;
			
			_isDisposed = false;
		}
		
		public function reset():void
		{
			axis.reset();
			angle = 0;
		}
		
		/**
		 * Disposes of this objects and frees the object ready for garbage collection.
		 */
		public function dispose(): void
		{
			axis.dispose();
			axis = null;
			
			_isDisposed = true;
		}
		
		public function get isDisposed():Boolean
		{
			return _isDisposed;
		}
		
		/**
		 * Returns a new <code>AxisAngle</code> object that is an shallow copy of this <code>AxisAngle</code> Object.
		 * 
		 * @return 	A new <code>AxisAngle</code> object that is an shallow copy of the current <code>AxisAngle</code> Object.
		 */
		public function clone(): *
		{
			return new AxisAngle( axis, angle );
		}
		
		/**
		 * Performs an equality check between this <code>AxisAngle</code> and another <code>AxisAngle</code> object.
		 * 
		 * @param	v	A <code>AxisAngle</code> object to compare against.
		 * @return	True if the <code>AxisAngle</code> objects contain the same x, y, and z values, false if not.
		 */
		public function equals( v: Object ): Boolean
		{
			if ( !(v is AxisAngle ) )
			{
				throw new Error( "An error occured in AxisAngle::equals(). Objetct type mismatch." );
			}
			return ( axis.equals( v.axis ) && ( angle == v.angle ) );
		}
		
	}

}