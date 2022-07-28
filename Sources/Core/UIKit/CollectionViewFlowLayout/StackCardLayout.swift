//
//  StackCardLayout.swift
//  
//
//  Created by aria on 2022/7/28.
//

import Foundation

public class StackCardLayout: UICollectionViewFlowLayout {
  
  override func prepare() {
    super.prepare()
    scrollDirection = .horizontal
    minimumInteritemSpacing = 0
    minimumLineSpacing = 0
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return super.layoutAttributesForElements(in: rect)?.map(attributesTransition)
  }
  
  private func attributesTransition(_ attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
    guard let collectionView = self.collectionView else { return attributes }
    
    let distance = collectionView.frame.width
    let itemOffset = attributes.center.x - collectionView.contentOffset.x
    
    attributes.zIndex = -attributes.indexPath.row
    let middleOffset = itemOffset / distance - 0.5
    if middleOffset > 0 {
      let maxOffset = min(2, middleOffset)
      let index: CGFloat = maxOffset * 0.11
      let scale: CGFloat = 1 - index
      var transform = CGAffineTransform(scaleX: scale, y: scale)
      
      transform = transform.concatenating(CGAffineTransform(translationX: -middleOffset * distance + maxOffset * 15 + index * attributes.frame.width / 2, y: 0))
      attributes.transform = transform
    }
    
    return attributes
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
  
}
