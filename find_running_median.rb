def extract_min(heap)
  return heap.pop if heap.length <= 1
  r = heap[0]
  heap[0] = heap.pop
  sift_down_min(heap, 0)
  r
end

def extract_max(heap)
  return heap.pop if heap.length <= 1
  r = heap[0]
  heap[0] = heap.pop
  sift_down_max(heap, 0)
  r
end

def sift_down_min(heap, i)
  return if i * 2 >= heap.length - 1
  left = i * 2 + 1
  right = i * 2 + 2
  min = i
  min = right if right < heap.length && heap[right] < heap[i]
  min = left if heap[left] < heap[min]
  return if min == i
  heap[i], heap[min] = heap[min], heap[i]
  sift_down_min(heap, min)
end

def sift_up_min(heap, i)
  return if i == 0
  parent = (i - 1) / 2
  return if heap[parent] <= heap[i]
  heap[parent], heap[i] = heap[i], heap[parent]
  sift_up_min(heap, parent)
end

def sift_down_max(heap, i)
  return if i * 2 >= heap.length - 1
  left = i * 2 + 1
  right = i * 2 + 2
  max = i
  max = right if right < heap.length && heap[right] > heap[i]
  max = left if heap[left] > heap[max]
  return if max == i
  heap[i], heap[max] = heap[max], heap[i]
  sift_down_max(heap, max)
end

def sift_up_max(heap, i)
  return if i == 0
  parent = (i - 1) / 2
  return if heap[parent] >= heap[i]
  heap[parent], heap[i] = heap[i], heap[parent]
  sift_up_max(heap, parent)
end

def add(heap, i, type)
  heap << i
  if type == 1
    sift_up_min(heap, heap.length - 1)
  else
    sift_up_max(heap, heap.length - 1)
  end
end

def find_median(min, max)
  if min.length > max.length
    min[0] / 1.0
  elsif max.length > min.length
    max[0] / 1.0
  else
    (min[0] + max[0]) / 2.0
  end
end

def balance_heaps(min, max)
  if min.length - max.length > 1
    add(max, extract_min(min), 2)
  elsif max.length - min.length > 1
    add(min, extract_max(max), 1)
  end
end

min_heap = []
max_heap = []
median = nil
n = gets.strip.to_i
n.times do
  x = gets.strip.to_i
  median = x if median.nil?
  if x > median
    add(min_heap, x, 1)
  else
    add(max_heap, x, 2)
  end
  balance_heaps(min_heap, max_heap)
  median = find_median(min_heap, max_heap)
  p median
end
